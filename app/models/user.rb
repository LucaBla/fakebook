class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  has_many :sended_requests, class_name: 'FriendRequest', foreign_key: 'sender_id', inverse_of: :sender
  has_many :received_requests, class_name: 'FriendRequest', foreign_key: 'receiver_id', inverse_of: :receiver

  has_and_belongs_to_many :friends,
                          class_name: 'User',
                          join_table: :friendships,
                          foreign_key: 'user_id',
                          association_foreign_key: 'friend_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
