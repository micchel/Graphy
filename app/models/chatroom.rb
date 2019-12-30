class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :photographer
  has_many   :chat_messages

  def no_user_read_messages
    no_read_count = self.chat_messages.where.not(photographer_id: 0).where("id > ?", self.readed_photographer_message).count
    if no_read_count > 0
      no_read_count.to_i
    else
      0
    end
  end

  def no_photographer_read_messages
    no_read_count = self.chat_messages.where.not(user_id: 0).where("id > ?", self.readed_user_message).count
    if no_read_count > 0
      no_read_count.to_i
    else
      0
    end
  end

end
