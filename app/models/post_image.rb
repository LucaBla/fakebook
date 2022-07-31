class PostImage < ApplicationRecord
  has_one_attached :content, dependent: :destroy

  validates :content, blob: { content_type: :image }
end
