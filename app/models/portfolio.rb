class Portfolio < ApplicationRecord
  belongs_to :photographer
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  mount_uploader :image, ImageUploader
end
