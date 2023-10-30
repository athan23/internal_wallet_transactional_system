# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_23_104118) do
  create_table "entities", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "auth_token"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth_token"], name: "index_entities_on_auth_token", unique: true
  end

  create_table "transaction_records", force: :cascade do |t|
    t.integer "amount"
    t.integer "transaction_type"
    t.integer "source_id"
    t.integer "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_transaction_records_on_source_id"
    t.index ["target_id"], name: "index_transaction_records_on_target_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "amount", default: 0
    t.string "walletable_type"
    t.integer "walletable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["walletable_type", "walletable_id"], name: "index_wallets_on_walletable"
  end

  add_foreign_key "transaction_records", "wallets", column: "source_id"
  add_foreign_key "transaction_records", "wallets", column: "target_id"
end
