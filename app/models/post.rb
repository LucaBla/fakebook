class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  belongs_to :postable, polymorphic: true
end
