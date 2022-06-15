class AddSenderIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :friend_requests, :sender_id, :integer
  end
end
