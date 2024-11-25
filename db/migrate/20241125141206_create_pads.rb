class CreatePads < ActiveRecord::Migration[7.1]
  def change
    create_table :pads do |t|
      t.integer :step
      t.references :drumrack, null: false, foreign_key: true

      t.timestamps
    end
  end
end
