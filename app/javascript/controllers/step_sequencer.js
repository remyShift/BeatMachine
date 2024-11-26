import * as Tone from "tone";

let bpm = 120;
let beat = 0;
let isPlaying = false;

// a changer avec les samples en question
const synths =[
  new Tone.Synth().toDestination(),
]

const Cnote = "C4"
let rows = [
  Array.from({ length: 16 }, (_, i) => ({ note: Cnote, active: false}))
]

Tone.Transport.scheduleRepeat(time => {
    rows.forEach((row, index) => {
      let synth = synths[index];
      let note = row[beat];
      if (note.active) synth.triggerAttackRelease(note.note, "16n", time);
    });
    //reset the beatvalue every 16th iteration
    beat = (beat + 1) % 16;
  }, "16");

const handleNoteClick = (rowIndex, noteIndex) => {
  // toggle the active attribute on the note
  rows[rowIndex][noteIndex].active = !rows[rowIndex][noteIndex].active;
};

const handlePlayClick = () => {
  //start audio context
  if (!isPlaying) Tone.start();
  //set bpm
  Tone.Transport.bpm.value = bpm;
  Tone.Transport.start();
  isPlaying = true
};

const handleStopClick =() => {
  Tone.Transport.stop();
  isPlaying = false;
};

// Ajouter un gestionnaire d'événements pour la mise à jour du BPM en temps réel
const bpmInput = document.querySelector('#bpm');
const bpmLabel = document.querySelector('#bpm-label');

bpmInput.addEventListener('input', function() {
  bpmLabel.textContent = `${bpmInput.value} BPM`;
  bpm = bpmInput.value; // met à jour la variable bpm

  // Si la lecture est en cours, mettez à jour le bpm de Tone.Transport
  if (isPlaying) {
    Tone.Transport.bpm.value = bpm;
  }
});

    // Javascript a changer d'endroiiit
    const bpmInput = document.querySelector('#bpm');
    const bpmLabel = document.querySelector('#bpm-label');

    // alalala j'ai meme pas utilisé stimulus
    bpmInput.addEventListener('input', function() {
      bpmLabel.textContent = `${bpmInput.value} BPM`;
    });
