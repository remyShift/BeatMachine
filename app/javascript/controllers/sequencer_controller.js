import { Controller } from "@hotwired/stimulus";
// import * as Tone from "tone"

// Connects to data-controller="sequencer"
export default class extends Controller {
  static values = { bpm: Number };
  static targets = ["pad"];

  connect() {
  }

  play() {
    let i = 0;

    setInterval(() => {
      this.padTargets.forEach((pad) => {
        pad.classList.remove("active");
      });
      const pad = document.querySelector("#pad-" + i);
      pad.classList.add("active");

      if (i % 4 === 0) {
        const audio = new Audio(pad.dataset.sample);
        audio.play();
      }

      i === 15 ? (i = 0) : i++;
    }, ((this.bpmValue / 4) * 60) / 2);
  }
}
