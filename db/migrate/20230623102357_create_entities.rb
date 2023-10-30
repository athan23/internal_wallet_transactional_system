class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :username
      t.string :password_digest
      t.string :auth_token
      t.string :type
      t.timestamps
    end

    add_index :entities, :auth_token, unique: true
  end
end
