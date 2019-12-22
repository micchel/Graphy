class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  
  belongs_to :prefecture
  has_many   :reactions, dependent: :destroy
  has_many   :photographer, through: :reactions
  has_many   :chatrooms, dependent: :destroy
  has_many   :chat_messages, dependent: :destroy

  enum sex: { male:1, female:2 }
  mount_uploader :avatar, ImageUploader

  def have_chatroom?(photographer)
    self.chatrooms.find_by(user_id: self.id, photographer_id: photographer.id).present?
  end

end
