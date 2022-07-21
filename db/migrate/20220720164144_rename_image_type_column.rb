class RenameImageTypeColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :plants, :type, :plant_type
  end
end
