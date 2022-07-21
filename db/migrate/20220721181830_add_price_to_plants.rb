class AddPriceToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :price, :integer
  end
end
