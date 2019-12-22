class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :photographer
  has_many   :chat_messages
end
