class Entity < ApplicationRecord
  has_one :wallet, as: :walletable

  validates :auth_token, uniqueness: { allow_blank: true }

  has_secure_password
end
