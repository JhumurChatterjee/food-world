module NameValidations
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true, uniqueness:{ case_sensitive: false }, length: { maximum: 250 }
  end
end
