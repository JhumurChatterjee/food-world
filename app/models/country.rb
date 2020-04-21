class Country < ApplicationRecord
  include NameValidations

  has_many :states, dependent: :destroy
end
