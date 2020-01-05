class Photographer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :photographer_prefectures, dependent: :destroy, inverse_of: :photographer
  accepts_nested_attributes_for :photographer_prefectures, allow_destroy: true
  has_many :prefectures, through: :photographer_prefectures
  has_many :portfolios, dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :users, through: :reactions
  has_many :chatrooms, dependent: :destroy
  has_many :chat_messages, dependent: :destroy

  enum sex: { male:1, female:2 }
  mount_uploader :avatar, ImageUploader

  def activity_area
    self.prefectures
  end

  validates :name,              presence: true, length: { maximum: 10 }
  validates :main_camera,       presence: true, length: { maximum: 10 }
  validates :sex_type,          presence: true
  validates :price,             presence: true, inclusion: { in: (10000..9999999) }
  validates :self_introduction, length: { maximum: 500 }
  validates :avatar,            presence: true
end
