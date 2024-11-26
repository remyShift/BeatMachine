require "open-uri"

# Destroys drumracks and pads
p "Destroying all drumracks and pads"
Drumrack.destroy_all
Pad.destroy_all

# Destroys all samples
Sample.destroy_all

# Destroys all tables de jointure
DrumrackSample.destroy_all
PadDrumrackSample.destroy_all

# Creates 1 samples of each category
sound_file = URI.open("https://res.cloudinary.com/dcuhxlv15/video/upload/v1732549962/kick1_yva25z.wav")
samples = []
["bass", "kick", "snare", "hihat", "oneshot"].each do |c|
  sample = Sample.new(category: c)
  sample.sound.attach(io: sound_file, filename: "kick.wav", content_type: "audio/wav")
  sample.save
  samples << sample
end
sound_file.close
# sound_file.rewind

# Defines each genre
genres = ["rock", "rap", "pop", "funk", "hip-hop", "jazz"]

# Creates drumracks
genres.each do |genre|
  # Create drumrack
  drumrack = Drumrack.new(name: "my drumrack", genre: genre, bpm: [100, 80, 120, 140, 110, 90].sample)
  drumrack_samples = []
  samples.each do |sample|
    drumrack_sample = DrumrackSample.new(sample: sample)
    drumrack_sample.drumrack = drumrack
    drumrack_sample.save
    drumrack_samples << drumrack_sample
  end

  16.times do  |i|
    pad = Pad.new(step: i + 1)
    pad.drumrack = drumrack
        pad_drumrack_sample = PadDrumrackSample.new()
        pad_drumrack_sample.drumrack_sample = drumrack_samples[1]
        if (i + 1)%rand(1..16) == 0
          pad_drumrack_sample.active = true
        end
        pad_drumrack_sample.pad = pad
        pad_drumrack_sample.save
        pad.save
      end

  drumrack.save
end
# Prints number of samples
p "Created #{Sample.count} samples"

# Prints number of drumracks
p "Created #{Drumrack.count} drumracks"

# Prints number of pads
p "#{Pad.count} pads created"
p Pad.last.pad_drumrack_samples.last.active
