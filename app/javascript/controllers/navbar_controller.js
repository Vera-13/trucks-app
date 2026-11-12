import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "submenu"]

  toggle() {
    this.menuTarget.classList.toggle("is-open")
  }

  toggleSub(event) {
    event.preventDefault()
    this.submenuTarget.classList.toggle("is-open")
  }
}
