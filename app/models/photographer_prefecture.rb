class PhotographerPrefecture < ApplicationRecord
  belongs_to :photographer
  belongs_to :prefecture

  validates :photographer, presence: true
  validates :prefecture_id, presence: true
end
