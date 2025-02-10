import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["track", "slide"];
  static values = {
    interval: { type: Number, default: 10000 },
  };

  connect() {
    if (this.slideTargets.length === 0) return;
    this.currentIndex = 1; // Start at the first real slide
    this.totalSlides = this.slideTargets.length;

    this.cloneSlides(); // Clone slides for seamless looping
    this.startAutoSlide();
    this.jumpWithoutTransition(); // Ensure correct position on load
    document.addEventListener("visibilitychange", this.handleVisibilityChange);

    this.trackTarget.style.transition = "none"; // Prevent animation during the initial setup
    this.trackTarget.style.transform = `translateX(-100%)`; // Start at the first real slide
  }
  handleVisibilityChange = () => {
    if (document.visibilityState === "visible") {
      this.jumpWithoutTransition();
      this.startAutoSlide();
    } else {
      this.stopAutoSlide();
    }
  };

  disconnect() {
    if (document.visibilityState !== "hidden") {
      this.stopAutoSlide();
    }
    document.removeEventListener("visibilitychange", this.handleVisibilityChange);
  }

  cloneSlides() {
    const firstSlide = this.slideTargets[0];
    const lastSlide = this.slideTargets[this.slideTargets.length - 1];

    // Clone first and last slides
    const firstClone = firstSlide.cloneNode(true);
    const lastClone = lastSlide.cloneNode(true);

    // Append and prepend the clones
    this.trackTarget.appendChild(firstClone);
    this.trackTarget.insertBefore(lastClone, firstSlide);

    this.totalSlides += 2; // Update total slides count
  }

  next() {
    this.showSlide(this.currentIndex + 1);
  }

  prev() {
    this.showSlide(this.currentIndex - 1);
  }

  jumpWithoutTransition() {
    if (!this.trackTarget) return;
    this.trackTarget.style.transition = "none"; // Disable animation
    const offset = -this.currentIndex * 100;
    this.trackTarget.style.transform = `translateX(${offset}%)`;

    // Force reflow to apply the "none" style instantly
    this.trackTarget.offsetHeight; // Triggers reflow
  }

  showSlide(index) {
    this.currentIndex = index;

    // Add smooth transition for normal slide changes
    this.trackTarget.style.transition = "transform 0.5s ease-in-out";
    const offset = -this.currentIndex * 100;
    this.trackTarget.style.transform = `translateX(${offset}%)`;

    // Handle looping: Jump to real slides without animation
    this.trackTarget.addEventListener(
      "transitionend",
      () => {
        if (this.currentIndex === 0) {
          // We're at the first cloned slide (before real first slide)
          this.currentIndex = this.slideTargets.length - 2; // Jump to last real slide
          this.jumpWithoutTransition();
        }

        if (this.currentIndex === this.slideTargets.length - 1) {
          // We're at the last cloned slide (after real last slide)
          this.currentIndex = 1; // Jump to first real slide
          this.jumpWithoutTransition();
        }
      },
      { once: true } // Ensure the event listener runs only once
    );
  }

  // Add a helper method to instantly reset without animation



  startAutoSlide() {
    this.autoSlideTimer = setInterval(() => {
      this.next();
    }, this.intervalValue);
  }

  stopAutoSlide() {
    clearInterval(this.autoSlideTimer);
  }
}
