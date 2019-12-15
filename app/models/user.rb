class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  
  belongs_to :prefecture
  has_many   :reactions, dependent: :destroy
  has_many   :photographer, through: :reactions

  enum sex: { male:1, female:2 }
  mount_uploader :avatar, ImageUploader

end
