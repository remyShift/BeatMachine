class Sample < ApplicationRecord
  has_many :pad_drumrack_samples
  has_one_attached :sound
end
