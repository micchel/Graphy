class Photographer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photographer_prefectures, dependent: :destroy
  has_many :prefectures, through: :photographer_prefectures
  has_many :portfolios, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :users, through: :reactions

  enum sex: { male:1, female:2 }
  mount_uploader :avatar, ImageUploader
end
