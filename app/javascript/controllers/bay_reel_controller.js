import { Controller } from "@hotwired/stimulus"

// Copies the polaroid set until the line is longer than the screen, then
// slides exactly one set and starts over. The reset lands on the same photo,
// so the line never runs out or jumps.
export default class extends Controller {
  static targets = ["track"]

  connect() {
    this.reduced = window.matchMedia("(prefers-reduced-motion: reduce)").matches
    this.onResize = () => {
      clearTimeout(this.resizeTimer)
      this.resizeTimer = setTimeout(() => this.fill(), 150)
    }
    window.addEventListener("resize", this.onResize)
    this.fill()
  }

  disconnect() {
    clearTimeout(this.resizeTimer)
    window.removeEventListener("resize", this.onResize)
  }

  fill() {
    const track = this.trackTarget
    track.classList.remove("is-running")
    track.querySelectorAll("[data-clone]").forEach((node) => node.remove())

    const setWidth = track.scrollWidth
    const viewport = track.parentElement.clientWidth
    if (setWidth === 0 || viewport === 0) return

    const originals = [...track.children]
    let guard = 0
    while (track.scrollWidth < viewport + setWidth && guard < 20) {
      originals.forEach((node) => {
        const clone = node.cloneNode(true)
        clone.dataset.clone = "true"
        const img = clone.querySelector("img")
        if (img) {
          img.alt = ""
          img.setAttribute("aria-hidden", "true")
        }
        track.appendChild(clone)
      })
      guard += 1
    }

    track.style.setProperty("--reel-shift", `-${setWidth}px`)
    track.style.setProperty("--reel-duration", `${Math.round(setWidth / 22)}s`)
    if (this.reduced) return

    void track.offsetWidth
    track.classList.add("is-running")
  }
}
