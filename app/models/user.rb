class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  
  has_many :sended_requests, class_name: 'FriendRequest', foreign_key: 'sender_id', inverse_of: :sender
  has_many :received_requests, class_name: 'FriendRequest', foreign_key: 'receiver_id', inverse_of: :receiver
  
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
