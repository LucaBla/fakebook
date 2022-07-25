class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes
  has_one :bio

  has_one_attached :image, dependent: :destroy

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
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  after_commit :add_image, :add_bio, on: [:create]
  # after_commit :add_image, on: [:create]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name # assuming the user model has a name
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  private

  def add_bio
    self.bio = Bio.new(content: '')
  end

  def add_image
    self.image.attach(io: File.open('app/assets/images/blank-user.png'), filename: 'blank-user.png')
  end
end
