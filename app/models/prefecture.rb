class Prefecture < ApplicationRecord
  has_many :users
  has_many :photographer_prefectures, dependent: :destroy
  has_many :photographers, through: :photographer_prefectures
end
