import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slide", "stage"]

  connect() {
    this.index = 0
    this.lockHeight()
    this.show(0)
    this.onResize = () => this.lockHeight()
    window.addEventListener("resize", this.onResize)
    if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) return
    if (this.slideTargets.length < 2) return

    this.timer = setInterval(() => this.next(), 7000)
  }

  disconnect() {
    clearInterval(this.timer)
    window.removeEventListener("resize", this.onResize)
  }

  lockHeight() {
    const width = this.stageTarget.clientWidth
    const height = this.slideTargets.reduce((max, slide) => {
      slide.style.width = `${width}px`
      return Math.max(max, slide.scrollHeight)
    }, 0)
    this.slideTargets.forEach((slide) => { slide.style.width = "" })
    this.stageTarget.style.height = `${height}px`
  }

  pause() {
    clearInterval(this.timer)
    this.timer = null
  }

  resume() {
    if (this.timer || window.matchMedia("(prefers-reduced-motion: reduce)").matches) return
    this.timer = setInterval(() => this.next(), 7000)
  }

  next() {
    this.show((this.index + 1) % this.slideTargets.length)
  }

  show(index) {
    this.index = index
    this.slideTargets.forEach((slide, i) => {
      const on = i === index
      slide.classList.toggle("is-on", on)
      slide.setAttribute("aria-hidden", on ? "false" : "true")
    })
  }
}
