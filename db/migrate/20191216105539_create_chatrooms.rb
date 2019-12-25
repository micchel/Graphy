class CreateChatrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chatrooms do |t|
      t.references    :user, null:false, foreign_key: true
      t.references    :photographer, null:false, foreign_key: true
      t.bigint        :readed_photographer_message, null: false, default: 0
      t.bigint        :readed_user_message, null: false, default: 0
      t.timestamps
    end
  end
end
