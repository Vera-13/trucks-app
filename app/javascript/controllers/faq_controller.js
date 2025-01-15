// controllers/faq_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["answer"];

  toggle(event) {
    const item = event.currentTarget;
    const answer = item.querySelector("[data-faq-target='answer']");

    if (answer) {
      answer.classList.toggle("open");
    }
  }
}
