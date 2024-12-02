import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menubar"
export default class extends Controller {
  static targets = ["toToggle"]

  connect() {
  }

  toggle(event) {
    this.toToggleTargets.forEach(target => {
      target.lastElementChild.classList.remove("hidden")
    })

    event.currentTarget.lastElementChild.classList.add("hidden")
  }
}
