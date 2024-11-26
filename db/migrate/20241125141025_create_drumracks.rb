class CreateDrumracks < ActiveRecord::Migration[7.1]
  def change
    create_table :drumracks do |t|
      t.string :name
      t.integer :bpm

      t.timestamps
    end
  end
end
