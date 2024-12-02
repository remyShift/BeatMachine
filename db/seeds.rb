require "open-uri"

# Destroys drumracks and pads
p "Destroying all drumracks and pads"
Drumrack.destroy_all
Pad.destroy_all

# Destroys all samples
p "Destroying all samples"
Sample.destroy_all

# Destroys all tables de jointure
p "Destroying all DrumrackSamples and PadDrumrackSamples"
DrumrackSample.destroy_all
PadDrumrackSample.destroy_all

# Creating sounds !
p "And now creating Remi's amazing sounds :)"

# Definition of a function to create sample
def create_sample(category:, file_url:, filename:)
  sound_file = URI.open(file_url)
  sample = Sample.new(category: category)
  sample.sound.attach(io: sound_file, filename: filename, content_type: "audio/mp3")
  sample.save
  sound_file.close
  sample
end

def create_pad_drumrack_sample(drumrack_sample, pad, active)
  PadDrumrackSample.create!(
    pad: pad,
    drumrack_sample: drumrack_sample,
    active: active
  )
end
# Definition of elements : sampes, bpm, active samples in pads that we are going to use in building seed
# # Array des sample par templates
samples_templates = {
  "reggaeton" => [
    { category: "bass", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709259/reggeaton_bass_ybbnef.mp3", filename: "reggeaton_bass_ybbnef.mp3" },
    { category: "kick", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709258/reggeaton_kick_vmbhse.mp3", filename: "reggeaton_kick_vmbhse.mp3" },
    { category: "snare", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709261/reggeaton_snare_qwnkii.mp3", filename: "reggeaton_snare_qwnkii.mp3" },
    { category: "hihat", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709258/reggeaton_hihat_wd0j0o.mp3", filename: "reggeaton_hihat_wd0j0o.mp3" },
    { category: "oneshot", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732709258/reggeaton_oneshot_jjb9dt.mp3", filename: "reggeaton_oneshot_jjb9dt.mp3" }
  ],
  "jerseyclub" => [
    { category: "bass", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802984/bass_jersey_kvmla8.mp3", filename: "bass_jersey_kvmla8.mp3" },
    { category: "kick", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802984/kick_jersey_dqhilm.mp3", filename: "kick_jersey_dqhilm.mp3" },
    { category: "snare", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802985/snare_jersey_qu3aso.mp3", filename: "snare_jersey_qu3aso.mp3" },
    { category: "hihat", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802984/hihat_jersey_aymree.mp3", filename: "hihat_jersey_aymree.mp3" },
    { category: "oneshot", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802984/oneshot_jersey_owmq5i.mp3", filename: "oneshot_jersey_owmq5i.mp3" }
  ],
  "bailefunk" => [
    { category: "bass", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802983/bass_bailefunk_tvbjop.mp3", filename: "bass_bailefunk_tvbjop.mp3" },
    { category: "kick", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802983/kick_bailefunk_brxyut.mp3", filename: "kick_bailefunk_brxyut.mp3" },
    { category: "snare", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802982/snare_bailefunk_bokp1p.mp3", filename: "snare_bailefunk_bokp1p.mp3" },
    { category: "hihat", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802983/hihat_bailefunk_b9pfzk.mp3", filename: "hihat_bailefunk_b9pfzk.mp3" },
    { category: "oneshot", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802983/oneshot_bailefunk_aaegon.mp3", filename: "oneshot_bailefunk_aaegon.mp3" }
  ],
  "trap" => [
    { category: "bass", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802984/bass_trap_iqasmj.mp3", filename: "bass_trap_iqasmj.mp3" },
    { category: "kick", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802984/kick_trap_kdhuzb.mp3", filename: "kick_trap_kdhuzb.mp3" },
    { category: "snare", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802984/snare_trap_wmtpfz.mp3", filename: "snare_trap_wmtpfz.mp3" },
    { category: "hihat", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802983/hihat_trap_wtxw1y.mp3", filename: "hihat_trap_wtxw1y.mp3" },
    { category: "oneshot", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802983/oneshot_trap_z32fqs.mp3", filename: "oneshot_trap_z32fqs.mp3" }
  ],
  "jazz" => [
    { category: "bass", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802985/bass_jazz_jcqnm6.mp3", filename: "bass_jazz_jcqnm6.mp3" },
    { category: "kick", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802985/kick_jazz_d0yse2.mp3", filename: "kick_jazz_d0yse2.mp3" },
    { category: "snare", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802985/snare_jazz_fmpoci.mp3", filename: "snare_jazz_fmpoci.mp3" },
    { category: "hihat", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802986/hihat_jazz_tchqs4.mp3", filename: "hihat_jazz_tchqs4.mp3" },
    { category: "oneshot", url: "https://res.cloudinary.com/dcuhxlv15/video/upload/v1732802986/oneshot_jazz_k9vlzv.mp3", filename: "oneshot_jazz_k9vlzv.mp3" }
  ]
}
# hash des bpm genre / templates
bpm_templates = {
  "reggaeton" => 90,
  "jerseyclub" => 150,
  "bailefunk" => 135,
  "trap" => 70,
  "jazz" => 80
}



# # index actif / inactif
templates_active_pads = {
  "reggaeton" => [
    { category: "bass", index: [2, 8, 14] },
    { category: "kick", index: [0, 4, 8, 12] },
    { category: "snare", index: [3, 6, 11, 14] },
    { category: "hihat", index: [1, 2, 3, 9, 10, 11] },
    { category: "oneshot", index: [0] }
  ],
  "jerseyclub" => [
    { category: "bass", index: [2] },
    { category: "kick", index: [0, 4, 8, 11, 14] },
    { category: "snare", index: [4, 12] },
    { category: "hihat", index: [0, 4, 8, 12] },
    { category: "oneshot", index: [2, 8, 14] }
  ],
  "bailefunk" => [
    { category: "bass", index: [4] },
    { category: "kick", index: [0, 10] },
    { category: "snare", index: [3, 6, 12] },
    { category: "hihat", index: [4, 8, 14] },
    { category: "oneshot", index: [14] }
  ],
  "trap" => [
    { category: "bass", index: [0, 8, 14] },
    { category: "kick", index: [0, 3, 6, 10, 14] },
    { category: "snare", index: [4, 8] },
    { category: "hihat", index: [1, 2, 8, 10, 11, 15] },
    { category: "oneshot", index: [0, 12] }
  ],
  "jazz" => [
    { category: "bass", index: [] },
    { category: "kick", index: [0, 2, 8, 14] },
    { category: "snare", index: [4, 12] },
    { category: "hihat", index: [0, 8] },
    { category: "oneshot", index: [0] }
  ]
};

# Define each genre
genres = ["reggaeton", "jerseyclub", "bailefunk", "trap", "jazz"];
genres.each do |genre|

  # Create drumrack
  drumrack = Drumrack.new(name: "My #{genre} drumrack", genre: genre, bpm: bpm_templates[genre], is_template: true)
  drumrack.save!


  # Create an array of samples for the genre iterated
  samples = []
  samples_templates[genre].each do |sample_template|
    samples << create_sample(category: sample_template[:category], file_url: sample_template[:url], filename: sample_template[:filename])
  end

# Create  an array of drumrack samples
  drumrack_samples = []
  samples.each do |sample|
    drumrack_sample = DrumrackSample.new(sample: sample)
    drumrack_sample.drumrack = drumrack
    drumrack_sample.save!
    drumrack_samples << drumrack_sample
  end

  # Create PadDrumrackSample for each drumrack sample
  pads = drumrack.pads

  drumrack_samples.each do |drumrack_sample|
    category = drumrack_sample.sample.category
    active_indexes = templates_active_pads[genre].find { |template| template[:category] == category }[:index]
    pads.each_with_index do |pad, i|
      bool = active_indexes.include?(i)
      create_pad_drumrack_sample(drumrack_sample, pad, bool)
    end
  end
end

 p "#{Drumrack.count} drumracks created"
 p "#{Sample.count} samples created"
 p "#{DrumrackSample.count} drumrack_samples created"
 p "#{PadDrumrackSample.count} pad_drumrack_samples created"
