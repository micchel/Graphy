class ChatMessage < ApplicationRecord
  belongs_to :user,         optional: true
  belongs_to :photographer, optional: true
  belongs_to :chatroom

  validates :user_id,          presence: true
  validates :photographer_id,  presence: true
  validates :chatroom_id,      presence: true
  validates :message,          presence: true,length: { maximum: 500, too_long: "最大%{count}文字まで使えます" }
end
