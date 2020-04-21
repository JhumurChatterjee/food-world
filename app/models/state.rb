class State < ApplicationRecord
  include NameValidations
  has_many :cities, dependent: :destroy

  belongs_to :country
end
