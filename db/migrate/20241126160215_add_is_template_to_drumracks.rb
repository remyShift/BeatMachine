class AddIsTemplateToDrumracks < ActiveRecord::Migration[7.1]
  def change
    add_column :drumracks, :is_template, :boolean, default: false
  end
end
