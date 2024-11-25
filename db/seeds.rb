# Destroys drumracks
p "Destroying all drumracks"
Drumrack.destroy_all

# Creates drumracks
drumrack = Drumrack.new(name: "My tune Reggaetown", bpm: 100)
drumrack.save

drumrack = Drumrack.new(name: "Naive new beaters", bpm: 120)
drumrack.save

# Prints number of drumracks
p "Created #{Drumrack.count} drumracks"
