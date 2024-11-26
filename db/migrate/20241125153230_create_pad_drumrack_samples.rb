class CreatePadDrumrackSamples < ActiveRecord::Migration[7.1]
  def change
    create_table :pad_drumrack_samples do |t|
      t.integer :velocity
      t.references :pad, null: false, foreign_key: true
      t.references :drumrack_sample, null: false, foreign_key: true

      t.timestamps
    end
  end
end
