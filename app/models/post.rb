class Post < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validate :image?

  after_create_commit { broadcast_prepend_to :posts}

  private

  def image?
    errors.add(:base, 'Please upload the image.') unless image.attached?
  end
end
