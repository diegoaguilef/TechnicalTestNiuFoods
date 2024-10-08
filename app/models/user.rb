class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def admin?
    role == 'admin'
  end

  def self.jwt_revoked?(_payload, _user)
    false
  end

  def self.revoke_jwt(_payload, _user)
  end
end
