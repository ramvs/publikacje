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

ActiveRecord::Schema.define(version: 20141112181417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atributelists", force: true do |t|
    t.integer  "publicationtype_id"
    t.integer  "atribute_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "atributevalues", force: true do |t|
    t.string   "wartosc"
    t.integer  "atribute_id"
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "atributs", force: true do |t|
    t.string   "name"
    t.string   "typ"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "autorlists", force: true do |t|
    t.boolean  "main_autor"
    t.integer  "autor_id"
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "autors", force: true do |t|
    t.string   "name"
    t.string   "surename"
    t.string   "email"
    t.string   "academic_degree"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", force: true do |t|
    t.datetime "add_date"
    t.text     "attention"
    t.string   "title"
    t.datetime "create_date"
    t.integer  "publicationsubtype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publicationsubtypes", force: true do |t|
    t.string   "name"
    t.integer  "publicationtype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publicationtypes", force: true do |t|
    t.string   "name"
    t.integer  "atributelist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
