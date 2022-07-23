class Plant < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :plant_type, :image_url, :care_level, :location, :description
  has_one_attached :image_url, dependent: :destroy
end
