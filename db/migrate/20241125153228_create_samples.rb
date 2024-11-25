class CreateSamples < ActiveRecord::Migration[7.1]
  def change
    create_table :samples do |t|
      t.string :type

      t.timestamps
    end
  end
end
