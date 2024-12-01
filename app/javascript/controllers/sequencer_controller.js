import { Controller } from "@hotwired/stimulus";


export default class extends Controller {
  static values = { bpm: Number, samples: Object, initialSamples: String, bpmValue: Number, drumrackId: Number };
  static targets = ["pad", "category", "bpmLabel", "bpmInput", "togglePlayBtn", "togglePlayBtnShow", "bpmLabelCurrent"];
  sampleSelected = null;
  soundBoxSamples = null;
  lastPadPlayed = 0;
  interval = null;
  isDrumrackChanged = false;

  soundsPads = [];

  connect() {
    this.padTargets.forEach(pad => {
      this.soundsPads.push({
        bass: new Audio(this.samplesValue["bass"]),
        snare: new Audio(this.samplesValue["snare"]),
        hihat: new Audio(this.samplesValue["hihat"]),
        kick: new Audio(this.samplesValue["kick"]),
        oneshot: new Audio(this.samplesValue["oneshot"])
      });
    })
    console.log(this.initialSamplesValue)
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
          this.categoryTargets.forEach(category => {
            category.dataset.played = "false";
          });
        });
        const pad = document.querySelector(`#pad-${this.lastPadPlayed}`);

        pad.dataset.active = "true";
        JSON.parse(pad.dataset.samples).forEach((sample) => {
          if (sample.active) {
            this.soundsPads[this.lastPadPlayed][sample.category].pause();
            this.soundsPads[this.lastPadPlayed][sample.category].currentTime = 0;
            this.soundsPads[this.lastPadPlayed][sample.category].play();
            pad.dataset.played = "true";
            this.lightUpPlayedSample(sample.category)
          }
        });

        this.lastPadPlayed === 15 ? (this.lastPadPlayed = 0) : this.lastPadPlayed++;
      }, (1000 / (this.bpmValue / 60)) / 4);
  }

  play() {
    if (this.interval === null) {
      this.playMusic();
    }
  }

  pause() {
    if (this.interval !== null) {
      this.pauseMusic();
    }
  }

  playShow() {
    this.playMusic();
  }

  pauseShow() {
    this.pauseMusic();
  }

  pauseMusic() {
    clearInterval(this.interval);
    this.interval = null;
  }

  selectSample(event) {
    this.sampleSelected = event.currentTarget.dataset.category;

    let sounds = {
      bass: new Audio(this.samplesValue["bass"]),
      snare: new Audio(this.samplesValue["snare"]),
      hihat: new Audio(this.samplesValue["hihat"]),
      kick: new Audio(this.samplesValue["kick"]),
      oneshot: new Audio(this.samplesValue["oneshot"])
    };

    sounds[this.sampleSelected].play();

    this.toggleCategorySelected(event);

    this.resetPads();

    this.lightUpSample();
  }

  lightUpSample() {
    this.padTargets.forEach(pad => {
      JSON.parse(pad.dataset.samples).forEach(sample => {
        if (sample.category === this.sampleSelected && sample.active) {
          pad.dataset.category = this.sampleSelected;
          pad.dataset.firstTemp = pad.dataset.index % 4 === 0 && pad.dataset.category === "";
        }
      });
    });
  }


  lightUpPlayedSample(playedCategory) {
    this.categoryTargets.find(category => category.dataset.category === playedCategory).dataset.played = "true";
  }

  resetPads() {
    const categories = ['bass', 'snare', 'hihat', 'kick', 'oneshot'];

    this.padTargets.forEach(pad => {
      categories.forEach(category => {
        pad.dataset.category = "";
        pad.dataset.firstTemp = pad.dataset.index % 4 === 0;
      });
    });
  }

  resetAll() {
    this.padTargets.forEach (async pad => {
      let changedSamples = await JSON.parse(pad.dataset.samples)

      changedSamples = changedSamples.map(sample => {
        sample.active = false;
        return sample;
      });
      pad.dataset.samples = JSON.stringify(changedSamples);
      pad.dataset.category = "";
    });
    this.pauseMusic();
    this.isDrumrackChanged = true;
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

    const sampleOnPadToActivate = changedSamples.find(sample => {
      return sample.category === this.sampleSelected
    });
    sampleOnPadToActivate.active = !sampleOnPadToActivate.active;

    changedSamples.forEach(sample => {
      if (sample.category === sampleOnPadToActivate.category) {
        sample.active = sampleOnPadToActivate.active;
      }
    });

    if(sampleOnPadToActivate.active) {
      currentPad.dataset.category = this.sampleSelected;
      currentPad.dataset.firstTemp = currentPad.dataset.index % 4 === 0 && currentPad.dataset.category === "";
    } else {
      currentPad.dataset.category = "";
    }

    this.padTargets[indexOfPad].dataset.samples = JSON.stringify(changedSamples);
    this.isDrumrackChanged = true;
  }

  save() {
    const padsSamples = this.padTargets.map(pad => pad.dataset.samples)
    fetch(`/drumracks/${this.drumrackIdValue}`, {
      method: "PATCH",
      body: JSON.stringify({
        pads: padsSamples
      }),
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      }
    });
  }

  decreaseBpm() {
    if (this.bpmValue > 60 && this.bpmValue <= 240) {
      this.bpmValue -= 5;
      this.bpmLabelCurrentTarget.innerHTML = `${this.bpmValue} BPM`;
      this.isDrumrackChanged = true;
      if (this.interval !== null) {
        this.pauseMusic();
        this.playMusic();
      }
    }
  }

  increaseBpm() {
    if (this.bpmValue >= 60 && this.bpmValue < 240) {
      this.bpmValue += 5;
      this.bpmLabelCurrentTarget.innerHTML = `${this.bpmValue} BPM`;
      this.isDrumrackChanged = true;
      if (this.interval !== null) {
        this.pauseMusic();
        this.playMusic();
      }
    }
  }
}
