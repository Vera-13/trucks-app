import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["track2", "dots"];
  currentIndex = 0;

  connect() {
    this.items = this.track2Target.children;
    this.itemsPerGroup = 4;
    this.totalItems = this.items.length;
    this.itemWidth = this.items[0].offsetWidth;
    this.track2Target.style.width = `${this.itemWidth * this.totalItems}px`;
    this.updateDots();
  }

  goToSlide(event) {
    const index = parseInt(event.target.dataset.index, 10);
    this.currentIndex = index * this.itemsPerGroup;
    this.updateTrackPosition();
    this.updateDots();
  }

  nextSlide() {
    if (this.currentIndex < this.totalItems - this.itemsPerGroup) {
      this.currentIndex += this.itemsPerGroup;
    } else {
      this.currentIndex = 0;
    }
    this.updateTrackPosition();
    this.updateDots();
  }

  prevSlide() {
    if (this.currentIndex > 0) {
      this.currentIndex -= this.itemsPerGroup;
    } else {
      this.currentIndex = this.totalItems - this.itemsPerGroup;
    }
    this.updateTrackPosition();
    this.updateDots();
  }

  updateTrackPosition() {
    const offset = -this.currentIndex * this.itemWidth;
    this.track2Target.style.transform = `translateX(${offset}px)`;
  }

  updateDots() {
    const dotElements = this.dotsTarget.children;
    const activeIndex = Math.floor(this.currentIndex / this.itemsPerGroup);

    Array.from(dotElements).forEach((dot, index) => {
      if (index === activeIndex) {
        dot.classList.add("active");
      } else {
        dot.classList.remove("active");
      }
    });
  }
}
