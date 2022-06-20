class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t| #, id: false
      t.belongs_to :user
      t.belongs_to :friend

      t.timestamps
    end
  end
end
