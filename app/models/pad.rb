class Pad < ApplicationRecord
  belongs_to :drumpad
  has_many :pad_drumrack_samples
end
