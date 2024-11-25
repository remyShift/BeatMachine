class Pad < ApplicationRecord
  belongs_to :drumrack
  has_many :pad_drumrack_samples
  has_many :samples, through: :pad_drumrack_samples
end
