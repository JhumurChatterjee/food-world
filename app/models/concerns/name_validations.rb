module NameValidations
  extend ActiveSupport::Concern

  included do
    validates :name, length: { maximum: 250 }
  end
end
