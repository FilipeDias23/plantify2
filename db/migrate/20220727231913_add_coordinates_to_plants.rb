class AddCoordinatesToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :latitude, :float
    add_column :plants, :longitude, :float
  end
end
