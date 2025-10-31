import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["track", "dots"]

  connect() {
    this.currentIndex = 0
    this.items = Array.from(this.trackTarget.children)

    window.addEventListener("load", () => this.initialize())
    window.addEventListener("resize", () => this.onResize())
  }

  disconnect() {
    window.removeEventListener("resize", this.onResize)
  }

  initialize() {
    if (!this.items.length) return

    this.setItemsPerGroup()
    this.itemWidth = this.items[0].offsetWidth
    this.totalItems = this.items.length
    this.trackTarget.style.width = `${this.itemWidth * this.totalItems}px`
    this.updateDots()
  }

  setItemsPerGroup() {
    const width = window.innerWidth

    if (width < 640) {
      this.itemsPerGroup = 1 // 📱 phones
    } else if (width < 1024) {
      this.itemsPerGroup = 2 // 💻 tablets
    } else {
      this.itemsPerGroup = 3 // 🖥️ desktops
    }
  }

  onResize() {
    const prevItemsPerGroup = this.itemsPerGroup
    this.setItemsPerGroup()
    if (prevItemsPerGroup !== this.itemsPerGroup) {
      this.initialize() // recalc widths & dots
    }
  }

  goToSlide(event) {
    const index = parseInt(event.currentTarget.dataset.index, 10)
    this.currentIndex = index * this.itemsPerGroup
    this.updateTrackPosition()
    this.updateDots()
  }

  updateTrackPosition() {
    const offset = -this.currentIndex * this.itemWidth
    this.trackTarget.style.transform = `translateX(${offset}px)`
    this.trackTarget.style.transition = "transform 0.5s ease"
  }

  updateDots() {
    const activeIndex = Math.floor(this.currentIndex / this.itemsPerGroup)
    this.dotsTarget.querySelectorAll(".dot").forEach((dot, i) => {
      dot.classList.toggle("active", i === activeIndex)
    })
  }
}
