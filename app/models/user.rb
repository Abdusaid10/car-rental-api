class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 4 }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password_digest, presence: true

  def self.digest(string)
    cost= ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
