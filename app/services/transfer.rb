class Transfer < ApplicationService
  class Error < StandardError; end

  def initialize(source_id, target_id, amount)
    @source_id = source_id
    @target_id = target_id
    @amount = amount
	end

	def call
    raise Error, 'Amount must be greater than zero' unless @amount.positive?

    source = Wallet.find_by(id: @source_id)
    target = Wallet.find_by(id: @target_id)
    raise Error, 'Target not found' if target.nil?
    raise Error, 'Cannot transfer to your own wallet' if source == target
    raise Error, 'Insufficient balance' if source.amount < @amount

		Wallet.transaction do
      source.decrement!(:amount, @amount)
      target.increment!(:amount, @amount)
      TransactionRecord.create!(amount: @amount, transaction_type: :transfer, source: source, target: target)
    end
	end
end
