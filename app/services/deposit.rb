class Deposit < ApplicationService
  class Error < StandardError; end

  def initialize(target_id, amount)
    @target_id = target_id
    @amount = amount
  end

  def call
    raise Error, 'Amount must be greater than zero' unless @amount.positive?

    Wallet.transaction do
      target = Wallet.find(@target_id)
      target.increment!(:amount, @amount)
      TransactionRecord.create!(amount: @amount, transaction_type: :deposit, source: nil, target: target)
    end
  end
end
