class CreateDrumrackSamples < ActiveRecord::Migration[7.1]
  def change
    create_table :drumrack_samples do |t|
      t.references :sample, null: false, foreign_key: true
      t.references :drumrack, null: false, foreign_key: true

      t.timestamps
    end
  end
end
