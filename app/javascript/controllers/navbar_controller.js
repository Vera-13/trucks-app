import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "dropdown"]

  toggle() {
    this.menuTarget.classList.toggle("active")
  }

}
