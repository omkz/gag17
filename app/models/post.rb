class Post < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true

  after_create_commit { broadcast_prepend_to :posts}
end
