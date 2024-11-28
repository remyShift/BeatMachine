class PadDrumrackSample < ApplicationRecord
  belongs_to :pad
  belongs_to :drumrack_sample
  has_one :sample, through: :drumrack_sample
end
