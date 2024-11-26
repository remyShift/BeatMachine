class Drumrack < ApplicationRecord
  has_many :pads, dependent: :destroy
end
