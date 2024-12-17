import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="services"
export default class extends Controller {
  static targets = ["readMore", "contactButton"];

  // Called when "Read More" is clicked
  readMoreClicked(event) {
    event.preventDefault();
    console.log("Read More clicked!");
    alert("You clicked on READ MORE.");
  }

  // Called when "Contact Us" is clicked
  contactButtonClicked(event) {
    event.preventDefault();
    console.log("Contact Us clicked!");
    alert("You clicked on CONTACT US.");
  }
}
