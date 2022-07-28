class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates_presence_of :name, :plant_type, :care_level, :location, :description, :price
  has_one_attached :image, dependent: :destroy

  # Geocoder
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
