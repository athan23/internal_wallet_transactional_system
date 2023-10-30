class CreateTransactionRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_records do |t|
      t.integer :amount
      t.integer :transaction_type
      t.references :source, foreign_key: { to_table: :wallets }
      t.references :target, foreign_key: { to_table: :wallets }
      t.timestamps
    end
  end
end
