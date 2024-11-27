import { Controller } from "@hotwired/stimulus";
// import * as Tone from "tone"

// Connects to data-controller="sequencer"
export default class extends Controller {
  static values = { bpm: Number, samples: Object };
  static targets = ["pad"];

  connect() {
    this.audioElements = {
      bass: new Audio(this.samplesValue["bass"]),
      snare: new Audio(this.samplesValue["snare"]), 
      hihat: new Audio(this.samplesValue["hihat"]),
      kick: new Audio(this.samplesValue["kick"]),
      oneshot: new Audio(this.samplesValue["oneshot"])
    };
  }

  play() {
    let i = 0;

    setInterval(() => {
      this.padTargets.forEach((pad) => {
        pad.classList.remove("active");
      });

      const pad = document.querySelector("#pad-" + i);
      pad.classList.add("active");

      console.log(pad.dataset.samples);

      JSON.parse(pad.dataset.samples).forEach((sample_str) => {
        const sample = JSON.parse(sample_str);
        console.log(sample);
        if (sample.active) {
          this.audioElements[sample.category].play();
        }
      });


      if (i % 4 === 0) {

      }

      i === 15 ? (i = 0) : i++;
    }, ((this.bpmValue / 4) * 60) / 2);
  }
}
