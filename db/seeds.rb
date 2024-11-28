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

# # Méthode pour créer un sample
# def create_sample(category:, file_url:, filename:)
#   sound_file = URI.open(file_url)
#   sample = Sample.new(category: category)
#   sample.sound.attach(io: sound_file, filename: filename, content_type: "audio/mp3")
#   sample.save
#   sound_file.close
#   sample
# end

# # Array des sample par genre
# samples_by_genre = {
#   "reggaeton" => [
#     { category: "bass", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709259/reggeaton_bass_ybbnef.mp3", filename: "reggeaton_bass_ybbnef.mp3" },
#     { category: "kick", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709258/reggeaton_kick_vmbhse.mp3", filename: "reggeaton_kick_vmbhse.mp3" },
#     { category: "snare", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709261/reggeaton_snare_qwnkii.mp3", filename: "reggeaton_snare_qwnkii.mp3" },
#     { category: "hihat", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709258/reggeaton_hihat_wd0j0o.mp3", filename: "reggeaton_hihat_wd0j0o.mp3" },
#     { category: "oneshot", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709258/reggeaton_oneshot_jjb9dt.mp3", filename: "reggeaton_oneshot_jjb9dt.mp3" }
#   ],
#   "dumbtechno" => [
#     { category: "bass", url: "", filename: "dumbtechno_bass_.mp3" },
#     { category: "kick", url: "", filename: "dumbtechno_kick_.mp3" },
#     { category: "snare", url: "", filename: "dumbtechno_snare_.mp3" },
#     { category: "hihat", url: "", filename: "dumbtechno_hihat_.mp3" },
#     { category: "oneshot", url: "", filename: "dumbtechno_oneshot_.mp3" }
#   ],
#   "jerseyclub" => [
#     { category: "bass", url: "", filename: "jerseyclub_bass_.mp3" },
#     { category: "kick", url: "", filename: "jerseyclub_kick_.mp3" },
#     { category: "snare", url: "", filename: "jerseyclub_snare_.mp3" },
#     { category: "hihat", url: "", filename: "jerseyclub_hihat_.mp3" },
#     { category: "oneshot", url: "", filename: "jerseyclub_oneshot_.mp3" }
#   ],
#   "pop" => [
#     { category: "bass", url: "", filename: "pop_bass_.mp3" },
#     { category: "kick", url: "", filename: "pop_kick_.mp3" },
#     { category: "snare", url: "", filename: "pop_snare_.mp3" },
#     { category: "hihat", url: "", filename: "pop_hihat_.mp3" },
#     { category: "oneshot", url: "", filename: "pop_oneshot_.mp3" }
#   ],
#   "bailefunk" => [
#     { category: "bass", url: "", filename: "bailefunk_bass_.mp3" },
#     { category: "kick", url: "", filename: "bailefunk_kick_.mp3" },
#     { category: "snare", url: "", filename: "bailefunk_snare_.mp3" },
#     { category: "hihat", url: "", filename: "bailefunk_hihat_.mp3" },
#     { category: "oneshot", url: "", filename: "bailefunk_oneshot_.mp3" }
#   ],
#   "trap" => [
#     { category: "bass", url: "", filename: "trap_bass_.mp3" },
#     { category: "kick", url: "", filename: "trap_kick_.mp3" },
#     { category: "snare", url: "", filename: "trap_snare_.mp3" },
#     { category: "hihat", url: "", filename: "trap_hihat_.mp3" },
#     { category: "oneshot", url: "", filename: "trap_oneshot_.mp3" }
#   ],
#   "jazz" => [
#     { category: "bass", url: "", filename: "jazz_bass_.mp3" },
#     { category: "kick", url: "", filename: "jazz_kick_.mp3" },
#     { category: "snare", url: "", filename: "jazz_snare_.mp3" },
#     { category: "hihat", url: "", filename: "jazz_hihat_.mp3" },
#     { category: "oneshot", url: "", filename: "jazz_oneshot_.mp3" }
#   ]
# }

# # Création des samples pour chaque genre
# samples_by_genre.each do |genre, samples|
#   puts "Création des samples pour le genre #{genre.capitalize}..."
#   samples.each do |sample|
#     create_sample(
#       category: sample[:category],
#       file_url: sample[:url],
#       filename: sample[:filename]
#     )
#   end
# end

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
genres = ["reggeaton", "jersey club", "pop", "baile funk", "trap", "jazz", "dumb techno"]

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
