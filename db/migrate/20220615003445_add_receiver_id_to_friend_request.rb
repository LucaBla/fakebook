class AddReceiverIdToFriendRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :friend_requests, :receiver_id, :integer
  end
end
