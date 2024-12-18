import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tracks"];
  currentIndex = 0;

  connect() {
    this.items = this.trackTarget.children;
    this.totalItems = this.items.length;
    this.itemWidth = this.items[0].offsetWidth + 30; // Width + margin
  }

  nextSlide() {
    if (this.currentIndex < this.totalItems - 1) {
      this.currentIndex++;
    } else {
      this.currentIndex = 0; // Loop back to the start
    }
    this.updateCarousel();
  }

  prevSlide() {
    if (this.currentIndex > 0) {
      this.currentIndex--;
    } else {
      this.currentIndex = this.totalItems - 1; // Loop to the end
    }
    this.updateCarousel();
  }

  updateCarousel() {
    const offset = -this.currentIndex * this.itemWidth;
    this.trackTarget.style.transform = `translateX(${offset}px)`;
  }
}
