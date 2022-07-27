class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates_presence_of :name, :plant_type, :care_level, :location, :description, :price
  has_one_attached :image, dependent: :destroy
end
