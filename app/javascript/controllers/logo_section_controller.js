import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["track", "dots"]

  connect() {
    // 1. Store original items
    this.originalItems = Array.from(this.trackTarget.children)
    if (this.originalItems.length === 0) return

    this.currentIndex = 0
    
    // 2. Clone items for the infinite loop effect
    this.originalItems.forEach(item => {
      const clone = item.cloneNode(true)
      this.trackTarget.appendChild(clone)
    })

    this.onResize = this.onResize.bind(this)
    window.addEventListener("resize", this.onResize)
    
    // Initialize
    this.initializeSlider()
  }

  initializeSlider() {
    this.setItemsPerGroup()
    this.updateTrackPosition(false)
    this.updateDots()
  }

  setItemsPerGroup() {
    const width = window.innerWidth
    if (width < 640) this.itemsPerGroup = 1
    else if (width < 1024) this.itemsPerGroup = 2
    else this.itemsPerGroup = 4 // Show 4 images
  }

  // The method called by the dots
  goToSlide(event) {
    const dotIndex = parseInt(event.currentTarget.dataset.index, 10)
    this.currentIndex = dotIndex * this.itemsPerGroup
    
    this.updateTrackPosition(true)
    this.updateDots()
  }

  updateTrackPosition(animated = true) {
    const firstItem = this.trackTarget.firstElementChild
    if (!firstItem) return

    // Get exact width of one logo
    const itemWidth = firstItem.getBoundingClientRect().width
    const offset = -this.currentIndex * itemWidth
    
    this.trackTarget.style.transition = animated ? "transform 0.5s ease-in-out" : "none"
    this.trackTarget.style.transform = `translateX(${offset}px)`
  }

  updateDots() {
    const activeDotIndex = Math.floor(this.currentIndex / this.itemsPerGroup)
    this.dotsTarget.querySelectorAll(".dot").forEach((dot, i) => {
      dot.classList.toggle("active", i === activeDotIndex)
    })
  }

  onResize() {
    this.setItemsPerGroup()
    this.updateTrackPosition(false)
  }

  disconnect() {
    window.removeEventListener("resize", this.onResize)
  }
}