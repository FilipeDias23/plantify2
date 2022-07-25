class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :plants, dependent: :destroy
  validates_presence_of :first_name, :last_name, :username, :profile_pic
  has_one_attached :profile_pic, dependent: :destroy
end
