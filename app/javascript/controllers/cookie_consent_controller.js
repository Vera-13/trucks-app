import { Controller } from "@hotwired/stimulus"

const STORAGE_KEY = "ton_cookie_consent"
const VERSION = 1

export default class extends Controller {
  static targets = ["banner", "panel", "analytics", "ads", "status"]
  static values = {
    enabled: Boolean,
    adsId: String,
    gaId: String,
    conversion: String,
    phone: String
  }

  connect() {
    this.choice = this.read()
    if (this.gpc() && this.choice?.source !== "choice") {
      this.choice = this.record({ analytics: false, ads: false, source: "gpc" })
      this.write(this.choice)
    }

    if (!this.choice) {
      this.showBanner()
      return
    }

    this.syncGoogle(this.choice)
  }

  acceptAll(event) {
    event.preventDefault()
    this.commit({ analytics: true, ads: true, source: "choice" })
  }

  rejectAll(event) {
    event.preventDefault()
    this.commit({ analytics: false, ads: false, source: "choice" })
  }

  saveSettings(event) {
    event.preventDefault()
    this.commit({
      analytics: this.analyticsTarget.checked,
      ads: this.adsTarget.checked,
      source: "choice"
    })
  }

  openSettings(event) {
    event?.preventDefault()
    this.syncToggles()
    this.panelTarget.hidden = false
    this.showBanner()
  }

  optOutShare(event) {
    event.preventDefault()
    this.commit({ analytics: false, ads: false, source: "choice" })
    this.setStatus("Advertising and analytics cookies are off. We do not sell personal information.")
  }

  commit(choice) {
    this.choice = this.record(choice)
    this.write(this.choice)
    this.syncGoogle(this.choice)
    this.hideBanner()
  }

  showBanner() {
    this.bannerTarget.hidden = false
  }

  hideBanner() {
    this.bannerTarget.hidden = true
    this.panelTarget.hidden = true
  }

  syncToggles() {
    const choice = this.choice || { analytics: false, ads: false }
    this.analyticsTarget.checked = choice.analytics === true
    this.adsTarget.checked = choice.ads === true
  }

  syncGoogle(choice) {
    window.__tonCookieChoice = choice
    if (!this.enabledValue) return

    if (!choice.analytics && !choice.ads) {
      this.updateConsent(choice)
      this.clearFirstPartyGoogleCookies()
      return
    }

    if (!window.__tonGoogleLoaded) this.injectGoogle(choice)
    else this.updateConsent(choice)

    this.bindPhoneTracking()
    this.setupPhoneTracking()
  }

  injectGoogle(choice) {
    window.dataLayer = window.dataLayer || []
    window.gtag = function gtag() { window.dataLayer.push(arguments) }
    this.updateConsentDefault()
    this.updateConsent(choice)
    window.gtag("js", new Date())
    window.gtag("config", this.gaIdValue)
    window.gtag("config", this.adsIdValue)

    const script = document.createElement("script")
    script.async = true
    script.src = `https://www.googletagmanager.com/gtag/js?id=${this.adsIdValue}`
    document.head.appendChild(script)
    window.__tonGoogleLoaded = true
  }

  updateConsentDefault() {
    window.gtag("consent", "default", {
      ad_storage: "denied",
      ad_user_data: "denied",
      ad_personalization: "denied",
      analytics_storage: "denied",
      functionality_storage: "denied",
      personalization_storage: "denied",
      security_storage: "granted"
    })
    window.gtag("set", "ads_data_redaction", true)
  }

  updateConsent(choice) {
    if (typeof window.gtag !== "function") return
    const ads = choice.ads ? "granted" : "denied"
    window.gtag("consent", "update", {
      analytics_storage: choice.analytics ? "granted" : "denied",
      ad_storage: ads,
      ad_user_data: ads,
      ad_personalization: ads
    })
    if (!choice.ads) this.clearFirstPartyGoogleCookies()
  }

  bindPhoneTracking() {
    if (window.__tonPhoneHooked) return
    window.__tonPhoneHooked = true
    const run = () => window.__tonSetupPhone?.()
    document.addEventListener("turbo:load", run)
    document.addEventListener("turbolinks:load", run)
  }

  setupPhoneTracking() {
    window.__tonSetupPhone = () => this.setupPhoneTracking()
    const choice = window.__tonCookieChoice
    if (!choice || typeof window.gtag !== "function") return

    if (choice.ads) {
      window.gtag("config", this.conversionValue, {
        phone_conversion_number: this.phoneValue,
        phone_conversion_callback: function(displayNumber, nonFormattedNumber) {
          const elements = document.getElementsByClassName("phone-number")
          for (let i = 0; i < elements.length; i++) {
            elements[i].href = "tel:" + nonFormattedNumber
            if (elements[i].innerHTML.includes("(702) 333-2463") || elements[i].innerHTML.includes("CLICK TO CALL")) {
              elements[i].innerHTML = displayNumber
            }
          }
        }
      })
    }

    if (choice.ads || choice.analytics) {
      const elements = document.getElementsByClassName("phone-number")
      for (let i = 0; i < elements.length; i++) {
        if (elements[i].dataset.callTracked === "1") continue
        elements[i].dataset.callTracked = "1"
        elements[i].addEventListener("click", function() {
          window.gtag("event", "phone_call_click", {
            event_category: "Contact",
            event_label: "Website Phone Click"
          })
        }, { once: true })
      }
    }
  }

  clearFirstPartyGoogleCookies() {
    const names = document.cookie.split(";").map((part) => part.split("=")[0].trim()).filter((name) => {
      return name === "_gid" || name === "_gat" || name.startsWith("_ga") || name.startsWith("_gcl")
    })
    const host = window.location.hostname
    names.forEach((name) => {
      ;[host, `.${host}`].forEach((domain) => {
        document.cookie = `${name}=; Max-Age=0; path=/; domain=${domain}`
      })
      document.cookie = `${name}=; Max-Age=0; path=/`
    })
  }

  read() {
    try {
      const parsed = JSON.parse(window.localStorage.getItem(STORAGE_KEY) || "null")
      if (!parsed || parsed.v !== VERSION) return null
      if (typeof parsed.analytics !== "boolean" || typeof parsed.ads !== "boolean") return null
      return parsed
    } catch (_error) {
      return null
    }
  }

  write(choice) {
    try {
      window.localStorage.setItem(STORAGE_KEY, JSON.stringify(choice))
    } catch (_error) {
      this.choice = choice
    }
  }

  record(choice) {
    return {
      v: VERSION,
      analytics: choice.analytics === true,
      ads: choice.ads === true,
      source: choice.source,
      at: new Date().toISOString()
    }
  }

  gpc() {
    return navigator.globalPrivacyControl === true
  }

  setStatus(message) {
    if (!this.hasStatusTarget) return
    this.statusTarget.textContent = message
  }
}
