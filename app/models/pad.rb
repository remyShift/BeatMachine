class Pad < ApplicationRecord
  belongs_to :drumrack
  has_many :pad_drumrack_samples, dependent: :destroy
  has_many :samples, through: :pad_drumrack_samples
end
