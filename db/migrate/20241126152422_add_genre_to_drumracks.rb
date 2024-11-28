class AddGenreToDrumracks < ActiveRecord::Migration[7.1]
  def change
    add_column :drumracks, :genre, :string
  end
end
