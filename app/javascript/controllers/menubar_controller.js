import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menubar"
export default class extends Controller {
  static targets = ["toToggle"]

  connect() {
    console.log('menubar connected')
  }

  toggle(event) {
    event.preventDefault()
    if (event.currentTarget.lastElementChild.classList.contains("hidden")) {
      this.toToggleTargets.forEach(target => {
        if (target == event.currentTarget) {
          target.lastElementChild.classList.toggle("hidden")
        } else {
          target.lastElementChild.classList.add("hidden")
        }
      })
    } else {
      event.currentTarget.lastElementChild.classList.toggle("hidden")
    }
  }
}
