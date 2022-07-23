class Plant < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :plant_type, :image_url, :care_level, :location, :description
  has_one_attached :photo, dependent: :destroy
end
