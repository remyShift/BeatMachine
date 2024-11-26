class AddActiveToPadDrumrackSamples < ActiveRecord::Migration[7.1]
  def change
    add_column :pad_drumrack_samples, :active, :boolean, default: false
  end
end
