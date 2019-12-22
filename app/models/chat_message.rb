class ChatMessage < ApplicationRecord
  belongs_to :user,         optional: true
  belongs_to :photographer, optional: true
  belongs_to :chatroom
end
