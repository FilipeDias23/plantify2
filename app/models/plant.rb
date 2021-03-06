class Plant < ApplicationRecord
  belongs_to :user
  has_one :booking, dependent: :destroy
  validates_presence_of :name, :plant_type, :care_level, :location, :description, :price
  validates :care_level, length: { in: 0..3 }
  has_one_attached :image, dependent: :destroy

  # Geocoder
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  #PG Search
  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [ :location, :name, :plant_type, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
