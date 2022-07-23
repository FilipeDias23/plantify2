class Plant < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :plant_type, :care_level, :location, :description, :price
  has_one_attached :image_url, dependent: :destroy
end
