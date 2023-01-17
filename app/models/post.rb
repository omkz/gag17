class Post < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validate :image_content_type

  after_create_commit { broadcast_prepend_to :posts}

  private

  def image_content_type
    allowed = %w[image/jpeg image/jpeg image/webp image/png]
    if allowed.exclude?(image.content_type)
      errors.add(:image, message: 'must be a JPG, JPEG, WEBP or PNG')
    end
  end

end
