class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, :password_digest, presence: true, length: { maximum: 250 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 250 }, format: { with: VALID_EMAIL_REGEX }
  validates :password, :password_confirmation, presence: true, length: { minimum: 6 }
  validates :phone_number, length: { minimum: 10, maximum: 10 }, allow_blank: true
end
