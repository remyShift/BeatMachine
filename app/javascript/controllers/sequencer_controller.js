import { Controller } from "@hotwired/stimulus";
// import * as Tone from "tone"

// Connects to data-controller="sequencer"
export default class extends Controller {
  static values = { bpm: Number, samples: Object };
  static targets = ["pad", "category"];

  connect() {
    this.audioElements = {
      bass: new Audio(this.samplesValue["bass"]),
      snare: new Audio(this.samplesValue["snare"]), 
      hihat: new Audio(this.samplesValue["hihat"]),
      kick: new Audio(this.samplesValue["kick"]),
      oneshot: new Audio(this.samplesValue["oneshot"])
    };
  }

  play(event) {
    this.toggleButtonPlayPause(event);

    let i = 0;
    if (this.interval) {
      clearInterval(this.interval);
      this.interval = null;
    } else {
      this.interval = setInterval(() => {
        this.padTargets.forEach((pad) => {
          pad.dataset.active = "false";
          pad.dataset.played = "false";
        });

        const pad = document.querySelector("#pad-" + i);
        pad.dataset.active = "true";

        JSON.parse(pad.dataset.samples).forEach((sample_str) => {
          const sample = JSON.parse(sample_str);
          if (sample.active) {
            this.audioElements[sample.category].play();
            pad.dataset.played = "true";
          }
        });

        i === 15 ? (i = 0) : i++;
      }, ((this.bpmValue / 4) * 60) / 2);
    }
  }

  toggleButtonPlayPause(event) {
    event.currentTarget.children[0].classList.toggle("hidden");
    event.currentTarget.children[1].classList.toggle("hidden");
  }

  selectSample(event) {
    this.toggleCategorySelected(event);

    const categories = ['bass', 'snare', 'hihat', 'kick', 'oneshot'];
    this.padTargets.forEach(pad => {
      categories.forEach(category => {
        pad.dataset.category = "";
      });
    });

    this.padTargets.forEach(pad => {
      JSON.parse(pad.dataset.samples).forEach(sample => {
        if (JSON.parse(sample).category === event.currentTarget.dataset.category && JSON.parse(sample).active) {
          pad.dataset.firstTemp = pad.dataset.index % 4 === 0;
          pad.dataset.category = event.currentTarget.dataset.category;
        }
      });
    });
  }

  toggleCategorySelected(event) {
    const currentPad = event.currentTarget;
    this.categoryTargets.forEach(target => {
      target === currentPad ? target.dataset.active = "true" : target.dataset.active = "false";
    });
  }
}
