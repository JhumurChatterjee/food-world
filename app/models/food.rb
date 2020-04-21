class Food < ApplicationRecord
  ALL_FOOD_TYPES = %w[veg non_veg].freeze
  enum food_type: ALL_FOOD_TYPES.zip(ALL_FOOD_TYPES).to_h

  FOOD_NATIONAL_TYPES = %w[continental indian].freeze
  enum delivery_type: FOOD_NATIONAL_TYPES.zip(FOOD_NATIONAL_TYPES).to_h

  belongs_to :restaurant

  has_many_attached :image

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: %i[restaurant_id] }
  validates :food_type, :delivery_type, presence: true, limit: 250
  validates :image, presence: true
  validate  :acceptable_image

  def acceptable_image
    return unless image.attached?

    unless image.byte_size <= 1.megabyte
      errors.add(:image, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be a JPEG or PNG")
    end
  end
end
