class Post < ApplicationRecord
  validates :title, presence: true

  after_create_commit { broadcast_prepend_to :posts}
end
