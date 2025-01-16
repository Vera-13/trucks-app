// controllers/tabs_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tab", "detail"];

  switch(event) {
    const tabName = event.currentTarget.dataset.tabsName;

    // Update tab active state
    this.tabTargets.forEach((tab) => {
      tab.classList.toggle("active", tab.dataset.tabsName === tabName);
    });

    // Show/Hide the corresponding details
    this.detailTargets.forEach((detail) => {
      detail.classList.toggle("active", detail.dataset.tabsName === tabName);
    });
  }

}
