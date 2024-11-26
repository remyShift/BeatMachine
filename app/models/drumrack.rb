class Drumrack < ApplicationRecord
  has_many :pads, dependent: :destroy
  has_many :drumrack_samples, dependent: :destroy
  has_many :samples, through: :drumrack_samples
  # we limit the number of associated drumrack_samples to 5
  validate :limit_number_of_associated_samples_to_5
  validate :limit_associated_samples_to_one_per_category

  private

  def limit_number_of_associated_samples_to_5
    if samples.size > 5
      errors.add(:base, "can't be more than 5")
    end
  end

  def limit_associated_samples_to_one_per_category
    categories = samples.map(&:category)
    if categories.size != categories.uniq.size
      errors.add(:base, "can't have more than one sample per category")
    end

  end

  # we limit the associated samples to one per sample's category
  # validates :samples, uniqueness: {scope: :category}
  # category: {bass: 0, kick: 10, snare: 20, hihat: 30, oneshot: 40}

end
