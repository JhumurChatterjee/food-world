class City < ApplicationRecord
  include NameValidations

  belongs_to :country
  belongs_to :state
end
