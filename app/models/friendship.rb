class Friendship < ApplicationRecord
  after_create :create_inverse

  def create_inverse
    Friendship.skip_callback(:create, :after, :create_inverse)

    friendship = Friendship.new
    friendship.user_id = self.friend_id
    friendship.friend_id = self.user_id
    self.user_id = 2
    friendship.save

    Friendship.set_callback(:create, :after, :create_inverse)
  end
end
