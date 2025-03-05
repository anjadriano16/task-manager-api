class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::JTIMatcher

  has_many :tasks

  before_create :set_jti

  private

  def set_jti
    self.jti ||= SecureRandom.uuid
  end
end
