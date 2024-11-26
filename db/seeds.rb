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


# Creates drumracks
# Create first drumrack
drumrack = Drumrack.new(name: "My tune Reggaetown", bpm: 100)

16.times do  |i|
  pad = Pad.new(step: i + 1)
  pad.drumrack = drumrack
 if (i + 1)%4 == 0
  pad.samples << sample
 end
  pad.save
end

drumrack.save

# Create second drumrack
drumrack = Drumrack.new(name: "Naive new beaters", bpm: 120)

16.times do  |i|
  pad = Pad.new(step: i + 1)
  pad.drumrack = drumrack
  if (i + 1)%3 == 0
    pad.samples << sample
  end
    pad.save
end


drumrack.save

# Prints number of samples
p "Created #{Sample.count} samples"

# Prints number of drumracks
p "Created #{Drumrack.count} drumracks"

# Prints number of pads
p "#{drumrack.pads.count} pads created for #{drumrack.name} drumrack"

# Prints number of pads sample was attached to
p "Sample kick was added to #{sample.pads.count} pads"
