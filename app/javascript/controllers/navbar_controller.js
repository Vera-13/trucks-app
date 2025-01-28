import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "dropdown"]

  toggle() {
    this.menuTarget.classList.toggle("active")
  }

  // toggleDropdown(event) {
  //   event.preventDefault()
  //   this.dropdownTarget.classList.toggle("active")
  // }
}
