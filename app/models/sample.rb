class Sample < ApplicationRecord
  has_many :pad_drumrack_samples, dependent: :destroy
  has_many :pads, through: :pad_drumrack_samples
  has_one_attached :sound
  enum category: {bass: 0, kick: 10, snare: 20, hihat: 30, oneshot: 40}
end
