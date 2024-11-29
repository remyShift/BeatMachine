import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="landscape"
export default class extends Controller {
  connect() {
    this.checkOrientation();
    this.interval = setInterval(() => this.checkOrientation(), 1000);
  }

  disconnect() {
    clearInterval(this.interval);
  }

  checkOrientation() {
    if (window.innerWidth > window.innerHeight) {
      this.element.dataset.isLandscape = "true";
    } else {
      this.element.dataset.isLandscape = "false";
    }
  }
}