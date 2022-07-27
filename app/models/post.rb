class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  belongs_to :postable, polymorphic: true
accepts_nested_attributes_for :postable
end
