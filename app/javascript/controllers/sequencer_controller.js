import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { bpm: Number, samples: Object, initialSamples: String, bpmValue: Number };
  static targets = ["pad", "category", "bpmLabel", "bpmInput", "togglePlayBtn"];
  sampleSelected = null;
  soundBoxSamples = null;
  lastPadPlayed = 0;
  interval = null;

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

  playMusic() {
    this.interval = setInterval(() => {
      this.padTargets.forEach((pad) => {
          pad.dataset.active = "false";
          pad.dataset.played = "false";
        });

        const pad = document.querySelector(`#pad-${this.lastPadPlayed}`);
        pad.dataset.active = "true";

        JSON.parse(pad.dataset.samples).forEach((sample) => {
          if (sample.active) {
            this.audioElements[sample.category].play();
            pad.dataset.played = "true";
          }
        });

        this.lastPadPlayed === 15 ? (this.lastPadPlayed = 0) : this.lastPadPlayed++;
      }, (1000 / (this.bpmValue / 60)) / 4);
  }

  play() {
    this.togglePlayBtnTarget.dataset.toggle = this.togglePlayBtnTarget.dataset.toggle === "false";
    this.playMusic();
  }

  pause() {
    this.togglePlayBtnTarget.dataset.toggle = this.togglePlayBtnTarget.dataset.toggle === "false";
    this.pauseMusic();
  }

  pauseMusic() {
    clearInterval(this.interval);
    this.interval = null;
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

  updateBpm(event) {
    this.bpmValue = event.target.value;
    this.bpmLabelTarget.textContent = `${this.bpmValue} BPM`;
    if (this.interval) {
      this.pauseMusic();
      this.playMusic();
    }
  }
}
