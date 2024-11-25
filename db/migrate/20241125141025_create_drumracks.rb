class CreateDrumracks < ActiveRecord::Migration[7.1]
  def change
    create_table :drumracks do |t|
      t.string :name
      t.integer :bpm
      t.references :pads, null: false, foreign_key: true

      t.timestamps
    end
  end
end
