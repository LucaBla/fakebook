class PostImage < ApplicationRecord
  has_one_attached :content, dependent: :destroy
end
