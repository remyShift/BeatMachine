import { Controller } from "@hotwired/stimulus";
// import * as Tone from "tone"

// Connects to data-controller="sequencer"
export default class extends Controller {
  static values = { bpm: Number, samples: Object, initialSamples: String };
  static targets = ["pad", "category"];
  sampleSelected = null;
  soundBoxSamples = null;
  changes = false;

  connect() {
    this.audioElements = {
      bass: new Audio(this.samplesValue["bass"]),
      snare: new Audio(this.samplesValue["snare"]),
      hihat: new Audio(this.samplesValue["hihat"]),
      kick: new Audio(this.samplesValue["kick"]),
      oneshot: new Audio(this.samplesValue["oneshot"])
    };

    this.soundBoxSamples = JSON.parse(this.initialSamplesValue).map(padSamples => {
      return padSamples.map(sample => {
        return JSON.parse(sample);
      });
    });

    this.padTargets.forEach((pad, index) => {
      pad.dataset.samples = JSON.stringify(this.soundBoxSamples[index]);
    });
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

        JSON.parse(pad.dataset.samples).forEach((sample) => {
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
    this.sampleSelected = event.currentTarget.dataset.category;
    this.audioElements[this.sampleSelected].play();

    this.toggleCategorySelected(event);

    this.resetPads();

    this.lightUpSample(event);
  }

  lightUpSample(event) {
    this.padTargets.forEach(pad => {
      JSON.parse(pad.dataset.samples).forEach(sample => {
        if (sample.category === this.sampleSelected && sample.active) {
          pad.dataset.firstTemp = pad.dataset.index % 4 === 0;
          pad.dataset.category = this.sampleSelected;
        }
      });
    });
  }

  resetPads() {
    const categories = ['bass', 'snare', 'hihat', 'kick', 'oneshot'];

    this.padTargets.forEach(pad => {
      categories.forEach(category => {
        pad.dataset.category = "";
      });
    });
  }

  toggleCategorySelected(event) {
    const currentPad = event.currentTarget;
    this.categoryTargets.forEach(target => {
      target === currentPad ? target.dataset.active = "true" : target.dataset.active = "false";
    });
    // this.categoryTargets.forEach(target => {
    //   target === currentPad ? target.dataset.active = "true" : target.dataset.active = "false";
    // });
  }

  addSampleToPad(event) {
    const currentPad = event.currentTarget;
    const indexOfPad = currentPad.dataset.index;
    const changedSamples = JSON.parse(currentPad.dataset.samples)


    currentPad.dataset.category = this.sampleSelected;

    const sampleOnPadToActivate = changedSamples.find(sample => {
      return sample.category === this.sampleSelected
    });
    sampleOnPadToActivate.active = !sampleOnPadToActivate.active;

    changedSamples.forEach(sample => {
      if (sample.category === sampleOnPadToActivate.category) {
        sample.active = sampleOnPadToActivate.active;
      }
    });


    this.padTargets[indexOfPad].dataset.samples = JSON.stringify(changedSamples);
  }

  save() {
    const currentSamples = this.padTargets.map(pad => {
      return JSON.parse(pad.dataset.samples);
    });
    const initialSampleshash = JSON.parse(this.initialSamplesValue).map((padSamples) =>
      padSamples.map((sample) =>
        JSON.parse(sample)
      )
    );
    console.log(initialSampleshash);
    console.log(currentSamples);
    console.log(initialSampleshash[0]);
    console.log(currentSamples[0]);
    console.log(initialSampleshash[0] === currentSamples[0]);

    // return JSON.stringify(this.soundBoxSamples) === JSON.stringify(currentSamples);
  }

}
