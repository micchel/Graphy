class CreateChatMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_messages do |t|
      t.bigint        :user_id, null:false, default: 0
      t.bigint        :photographer_id, null:false, default: 0
      t.references    :chatroom, null:false, foreign_key: true
      t.string        :message, null:false
      t.timestamps
    end
  end
end
