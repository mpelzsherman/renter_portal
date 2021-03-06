# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140909165540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "landlords", force: true do |t|
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "management_company"
  end

  add_index "landlords", ["email"], name: "index_landlords_on_email", unique: true, using: :btree
  add_index "landlords", ["reset_password_token"], name: "index_landlords_on_reset_password_token", unique: true, using: :btree

  create_table "properties", force: true do |t|
    t.integer  "landlord_id"
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_request_comments", force: true do |t|
    t.integer  "service_request_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  add_index "service_request_comments", ["service_request_id"], name: "index_service_request_comments_on_service_request_id", using: :btree

  create_table "service_requests", force: true do |t|
    t.integer  "tenant_id"
    t.integer  "property_id"
    t.text     "content"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_requests", ["property_id"], name: "index_service_requests_on_property_id", using: :btree
  add_index "service_requests", ["tenant_id"], name: "index_service_requests_on_tenant_id", using: :btree

  create_table "tenants", force: true do |t|
    t.integer  "property_id"
    t.integer  "account_id"
    t.string   "stripe_customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "photo_url"
    t.string   "unit"
  end

  add_index "tenants", ["email"], name: "index_tenants_on_email", unique: true, using: :btree
  add_index "tenants", ["reset_password_token"], name: "index_tenants_on_reset_password_token", unique: true, using: :btree

end
