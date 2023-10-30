class TransactionRecord < ApplicationRecord
  enum transaction_type: { deposit: 0, withdraw: 1, transfer: 2 }

  belongs_to :source, class_name: 'Wallet', optional: true
  belongs_to :target, class_name: 'Wallet', optional: true

  validates :amount, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
