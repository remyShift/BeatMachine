class AddUserAndDrumracks < ActiveRecord::Migration[7.1]
  def change
    add_reference :drumracks, :user, foreign_key: true, null: true
  end
end
