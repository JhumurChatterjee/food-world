class Restaurant < ApplicationRecord
  include NameValidations

  ALL_DELIVERY_TYPES = %w[take_away home_delivery].freeze
  enum delivery_type: ALL_DELIVERY_TYPES.zip(ALL_DELIVERY_TYPES).to_h

  ALL_FOOD_TYPES = %w[breakfast lunch snacks dinner].freeze
  enum food_type: ALL_FOOD_TYPES.zip(ALL_FOOD_TYPES).to_h

  DELIVERY_EMERGENCY_TYPES = %w[immediate late].freeze
  enum delivery_emergency: DELIVERY_EMERGENCY_TYPES.zip(DELIVERY_EMERGENCY_TYPES).to_h

  belongs_to :city
  belongs_to :state
  belongs_to :country

  has_many_attached :images
  has_many :foods, dependent: :destroy

  validates :food_type, :delivery_type, :delivery_emergency, :street_address, :phone_number, presence: true, length: { maximum: 250 }
  validates :images, presence: true
  # before_validation  :acceptable_food_image, on: [:create, :update]
  # validate :acceptable_image

  accepts_nested_attributes_for :foods, allow_destroy: true

  def acceptable_image
    return if images.blank?

    image_sizes = images.map(&:byte_size)
    unless image_sizes.all?{ |i| i< 1.megabyte }
      errors.add(:image, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    content_types = images.map(&:content_type)
    unless acceptable_types & content_types
      errors.add(:image, "must be a JPEG or PNG")
    end
    binding.pry

  end

  def acceptable_food_image

      errors.add(:images, "All the images must be less than 1MB")  if foods.first.image.byte_size > 1.megabytes

  end
end
