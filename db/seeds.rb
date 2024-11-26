require "open-uri"

# Destroys drumracks and pads
p "Destroying all drumracks and pads"
Drumrack.destroy_all
Pad.destroy_all

# Destroys all samples
Sample.destroy_all

# Creates sample kick
sound_file = URI.open("https://res.cloudinary.com/dcuhxlv15/video/upload/v1732549962/kick1_yva25z.wav")
sample = Sample.new(category: "kick")
# sound_file.rewind
sample.sound.attach(io: sound_file, filename: "kick.wav", content_type: "audio/wav")
sample.save
sound_file.close


genres = ["rock", "jazz", "rap", "pop", "funk", "hip-hop"]
drumrack_names = ["Funky Beats", "Rock Solid", "Jazz Fusion", "Pop Hits", "Rap Attack", "Groove Master"]
bpm_range = (80..160)

# Création de 6 drumracks
genres.each_with_index do |genre, index|
  # Création d'un nouveau drumrack avec des valeurs aléatoires
  drumrack = Drumrack.new(
    name: drumrack_names[index],
    bpm: bpm_range.to_a.sample,
    genre: genre
  )

  # Création des 16 pads pour chaque drumrack
  16.times do |i|
    pad = Pad.new(step: i + 1)
    pad.drumrack = drumrack
    # Ajout aléatoire du sample (1 chance sur 3)
    if rand(3) == 0
      pad.samples << sample
    end
    pad.save
  end

  drumrack.save
end

# Prints number of samples
p "Created #{Sample.count} samples"

# Prints number of drumracks
p "Created #{Drumrack.count} drumracks"

# Prints number of pads sample was attached to
p "Sample kick was added to #{sample.pads.count} pads"
