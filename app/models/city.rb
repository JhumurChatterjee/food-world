class City < ApplicationRecord
  include NameValidations

  belongs_to :state
end
