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

  has_many_attached :image

  validates :food_type, :delivery_type, :delivery_emergency, presence: true, :street_address, :phone_number, limit: 250
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
