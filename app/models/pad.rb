class Pad < ApplicationRecord
  belongs_to :drumrack
  has_many :pad_drumrack_samples, dependent: :destroy
  has_many :drumrack_samples, through: :pad_drumrack_samples
  has_many :samples, through: :drumrack_samples
end
