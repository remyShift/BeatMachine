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

# def create_sample(category:, file_url:, filename:)
#   sound_file = URI.open(file_url)
#   sample = Sample.new(category: category)
#   sample.sound.attach(io: sound_file, filename: filename, content_type: "audio/mp3")
#   sample.save
#   sound_file.close
#   sample
# end

# # Array des sample par templates
# samples_templates = {
#   "reggaeton" => [
#     { category: "bass", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709259/reggeaton_bass_ybbnef.mp3", filename: "reggeaton_bass_ybbnef.mp3" },
#     { category: "kick", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709258/reggeaton_kick_vmbhse.mp3", filename: "reggeaton_kick_vmbhse.mp3" },
#     { category: "snare", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709261/reggeaton_snare_qwnkii.mp3", filename: "reggeaton_snare_qwnkii.mp3" },
#     { category: "hihat", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709258/reggeaton_hihat_wd0j0o.mp3", filename: "reggeaton_hihat_wd0j0o.mp3" },
#     { category: "oneshot", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709258/reggeaton_oneshot_jjb9dt.mp3", filename: "reggeaton_oneshot_jjb9dt.mp3" }
#   ],

#   "jerseyclub" => [
#     { category: "bass", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802984/bass_jersey_kvmla8.mp3", filename: "bass_jersey_kvmla8.mp3" },
#     { category: "kick", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802984/kick_jersey_dqhilm.mp3", filename: "kick_jersey_dqhilm.mp3" },
#     { category: "snare", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802985/snare_jersey_qu3aso.mp3", filename: "snare_jersey_qu3aso.mp3" },
#     { category: "hihat", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802984/hihat_jersey_aymree.mp3", filename: "hihat_jersey_aymree.mp3" },
#     { category: "oneshot", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802984/oneshot_jersey_owmq5i.mp3", filename: "oneshot_jersey_owmq5i.mp3" }
#   ],

#   "bailefunk" => [
#     { category: "bass", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802983/bass_bailefunk_tvbjop.mp3", filename: "bass_bailefunk_tvbjop.mp3" },
#     { category: "kick", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802983/kick_bailefunk_brxyut.mp3", filename: "kick_bailefunk_brxyut.mp3" },
#     { category: "snare", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802982/snare_bailefunk_bokp1p.mp3", filename: "snare_bailefunk_bokp1p.mp3" },
#     { category: "hihat", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802983/hihat_bailefunk_b9pfzk.mp3", filename: "hihat_bailefunk_b9pfzk.mp3" },
#     { category: "oneshot", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802983/oneshot_bailefunk_aaegon.mp3", filename: "oneshot_bailefunk_aaegon.mp3" }
#   ],
#   "trap" => [
#     { category: "bass", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802984/bass_trap_iqasmj.mp3", filename: "bass_trap_iqasmj.mp3" },
#     { category: "kick", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802984/kick_trap_kdhuzb.mp3", filename: "kick_trap_kdhuzb.mp3" },
#     { category: "snare", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802984/snare_trap_wmtpfz.mp3", filename: "snare_trap_wmtpfz.mp3" },
#     { category: "hihat", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802983/hihat_trap_wtxw1y.mp3", filename: "hihat_trap_wtxw1y.mp3" },
#     { category: "oneshot", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802983/oneshot_trap_z32fqs.mp3", filename: "oneshot_trap_z32fqs.mp3" }
#   ],
#   "jazz" => [
#     { category: "bass", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802985/bass_jazz_jcqnm6.mp3", filename: "bass_jazz_jcqnm6.mp3" },
#     { category: "kick", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802985/kick_jazz_d0yse2.mp3", filename: "kick_jazz_d0yse2.mp3" },
#     { category: "snare", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802985/snare_jazz_fmpoci.mp3", filename: "snare_jazz_fmpoci.mp3" },
#     { category: "hihat", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802986/hihat_jazz_tchqs4.mp3", filename: "hihat_jazz_tchqs4.mp3" },
#     { category: "oneshot", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802986/oneshot_jazz_k9vlzv.mp3", filename: "oneshot_jazz_k9vlzv.mp3" }
#   ]
# }

# # Création des samples pour chaque genre
# samples_templates.each do |genre, samples|
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
