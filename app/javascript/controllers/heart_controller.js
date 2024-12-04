import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["icon"];

  connect() {
    console.log("Heart controller connected!");
  }

  toggleColor() {
    if (this.iconTarget.classList.contains("text-red-500")) {
      this.iconTarget.classList.remove("text-red-500");
      this.iconTarget.classList.add("text-black");
    } else {
      this.iconTarget.classList.remove("text-black");
      this.iconTarget.classList.add("text-red-500");
    }
  }
}
