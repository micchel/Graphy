class Portfolio < ApplicationRecord
  belongs_to :photographer
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  mount_uploader :image, ImageUploader

  def not_matched?(user)
    self.photographer.users.exclude?(user) || self.nope_reaction?(user)
  end

  def nope_reaction?(user)
    self.photographer.reactions.find_by(user_id: user.id ,photographer_id: self.photographer.id ,status: 0).present?
  end

  validates :photographer_id, presence: true
  validates :category_id,     presence: true, inclusion: { in: (1..6) }
  validates :image,           presence: true
end
