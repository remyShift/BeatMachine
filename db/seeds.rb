# Destroys drumracks
p "Destroying all drumracks and pads"
Pad.destroy_all
Drumrack.destroy_all

# Creates drumracks
# Create first drumrack
drumrack = Drumrack.new(name: "My tune Reggaetown", bpm: 100)

16.times do
  n = 1
  pad = Pad.new(step: n)
  pad.drumrack = drumrack
  pad.save
  n+=1
end

drumrack.save
p "#{drumrack.pads.count} pads created for #{drumrack.name} drumrack"
# Create second drumrack
drumrack = Drumrack.new(name: "Naive new beaters", bpm: 120)

16.times do
  n = 1
  pad = Pad.new(step: n)
  pad.drumrack = drumrack
  pad.save
  n+=1
end

drumrack.save
p "#{drumrack.pads.count} pads created for #{drumrack.name} drumrack"

# Prints number of drumracks
p "Created #{Drumrack.count} drumracks"
