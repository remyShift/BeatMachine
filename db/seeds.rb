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

# creating 1 user
p "creating 1 user"
User.create!(
  email: 'user@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)

# Creates 1 samples of each category
samples = []

# Creates a bass sample and pushes it to the samples array
sound_file = URI.open("https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709259/reggeaton_bass_ybbnef.mp3")
sample = Sample.new(category: "bass")
sample.sound.attach(io: sound_file, filename: "reggeaton_bass_ybbnef.mp3", content_type: "audio/mp3")
sample.save
samples << sample
sound_file.close

# Creates a kick sample and pushes it to the samples array
sound_file = URI.open("https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709258/reggeaton_kick_vmbhse.mp3")
sample = Sample.new(category: "kick")
sample.sound.attach(io: sound_file, filename: "reggeaton_kick_vmbhse.mp3", content_type: "audio/mp3")
sample.save
samples << sample
sound_file.close

# Creates a snare sample and pushes it to the samples array
sound_file = URI.open("https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709261/reggeaton_snare_qwnkii.mp3")
sample = Sample.new(category: "snare")
sample.sound.attach(io: sound_file, filename: "reggeaton_snare_qwnkii.mp3", content_type: "audio/mp3")
sample.save
samples << sample
sound_file.close


# Creates a hihat sample and pushes it to the samples array
sound_file = URI.open("https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709258/reggeaton_hihat_wd0j0o.mp3")
sample = Sample.new(category: "hihat")
sample.sound.attach(io: sound_file, filename: "reggeaton_hihat_wd0j0o.mp3", content_type: "audio/mp3")
sample.save
samples << sample
sound_file.close


# Creates a oneshot sample and pushes it to the samples array
sound_file = URI.open("https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709258/reggeaton_oneshot_jjb9dt.mp3")
sample = Sample.new(category: "oneshot")
sample.sound.attach(io: sound_file, filename: "reggeaton_oneshot_jjb9dt.mp3", content_type: "audio/mp3")
sample.save
samples << sample
sound_file.close

# Defines each genre
genres = ["rock", "rap", "pop", "funk", "hip-hop", "jazz"]

# Creates one drumrack per genre
genres.each do |genre|
  # Create drumrack
  drumrack = Drumrack.new(name: "my drumrack", genre: genre, bpm: [100, 80, 120, 140, 110, 90].sample, is_template: true)
  drumrack.save!
   # Create one drumrack_sample per sample
  drumrack_samples = []
  samples.each do |sample|
    drumrack_sample = DrumrackSample.new(sample: sample)
    drumrack_sample.drumrack = drumrack
    drumrack_sample.save!
    drumrack_samples << drumrack_sample
  end

  pads = drumrack.pads
  drumrack_samples.each do |drumrack_sample|
    tempo = rand(1..16)
    pads.each_with_index do |pad, i|
      bool = (i + 1)%tempo == 0
      PadDrumrackSample.create!(
        pad: pad,
        drumrack_sample: drumrack_sample,
        active: bool
      )
    end
  end
end
# Prints number of samples
p "Created #{Sample.count} samples"

# Prints number of drumracks
p "Created #{Drumrack.count} drumracks"

# Prints number of pads
p "#{Pad.count} pads created"
