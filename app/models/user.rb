require 'securerandom'

class User < ApplicationRecord
  before_create :set_api_key
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true, length: {minimum: 8}
  
  def generate_api_key
    SecureRandom.base58(24)
  end

  def set_api_key
    self.api_key = generate_api_key
  end
end