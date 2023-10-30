class Withdraw < ApplicationService
  class Error < StandardError; end

  def initialize(source_id, amount)
    @source_id = source_id
    @amount = amount
  end

  def call
    raise Error, 'Amount must be greater than zero' unless @amount.positive?

    source = Wallet.find(@source_id)
    raise Error, 'Insufficient balance' if source.amount < @amount

    Wallet.transaction do
      source.decrement!(:amount, @amount)
      TransactionRecord.create!(amount: @amount, transaction_type: :withdraw, source: source, target: nil)
    end
  end
end
