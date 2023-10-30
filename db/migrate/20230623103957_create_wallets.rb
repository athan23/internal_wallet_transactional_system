class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.integer :amount, default: 0
      t.references :walletable, polymorphic: true
      t.timestamps
    end
  end
end
