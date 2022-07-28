class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :plants, dependent: :destroy
  validates_presence_of :first_name, :last_name, :username, :location
  has_one_attached :profile_pic, dependent: :destroy

  # Geocoder
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
