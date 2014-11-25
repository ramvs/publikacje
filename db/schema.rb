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

ActiveRecord::Schema.define(version: 20141125151356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attribute_positions", force: true do |t|
    t.boolean  "required"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "attribute_id"
    t.integer  "publication_type_id"
  end

  create_table "attribute_values", force: true do |t|
    t.string   "attribute_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publication_id"
    t.integer  "attribute_id"
  end

  create_table "attributes", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "author_positions", force: true do |t|
    t.boolean  "main"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publication_id"
    t.integer  "author_id"
  end

  create_table "authors", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "academic_degree"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "authors", ["user_id"], name: "index_authors_on_user_id", using: :btree

  create_table "publication_subtypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publication_type_id"
  end

  create_table "publication_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "creation_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "publication_subtype_id"
  end

  add_index "publications", ["publication_subtype_id"], name: "index_publications_on_publication_subtype_id", using: :btree
  add_index "publications", ["user_id"], name: "index_publications_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end