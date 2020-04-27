class Food < ApplicationRecord
  ALL_FOOD_TYPES = %w[veg non_veg].freeze
  enum food_type: ALL_FOOD_TYPES.zip(ALL_FOOD_TYPES).to_h

  FOOD_NATIONAL_TYPES = %w[continental indian].freeze
  enum continental: FOOD_NATIONAL_TYPES.zip(FOOD_NATIONAL_TYPES).to_h

  belongs_to :restaurant

  has_many_attached :images

  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: %i[restaurant_id] }
  validates :food_type, :continental, presence: true, length:{ maximum: 250 }
  validates :images, presence: true
end
