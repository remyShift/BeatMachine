class CreateSamples < ActiveRecord::Migration[7.1]
  def change
    create_table :samples do |t|
      t.string :type
      t.references :pad_drumrack_samples, null: false, foreign_key: true

      t.timestamps
    end
  end
end
