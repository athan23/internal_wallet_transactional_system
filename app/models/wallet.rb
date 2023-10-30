class Wallet < ApplicationRecord
  validates :amount, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  belongs_to :walletable, polymorphic: true
end
