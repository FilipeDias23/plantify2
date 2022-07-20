class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :type
      t.text :description
      t.string :name
      t.string :image_url
      t.integer :care_level
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
