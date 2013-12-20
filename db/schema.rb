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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130802001649667) do

  create_table "authentications", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "user_name"
    t.string   "auth_token"
    t.datetime "oauth_expires_at"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "auth_secret"
  end

  add_index "authentications", ["auth_secret"], :name => "index_authentications_on_auth_secret"
  add_index "authentications", ["auth_token"], :name => "index_authentications_on_auth_token"
  add_index "authentications", ["created_at"], :name => "index_authentications_on_created_at"
  add_index "authentications", ["oauth_expires_at"], :name => "index_authentications_on_oauth_expires_at"
  add_index "authentications", ["provider"], :name => "index_authentications_on_provider"
  add_index "authentications", ["uid"], :name => "index_authentications_on_uid"
  add_index "authentications", ["updated_at"], :name => "index_authentications_on_updated_at"
  add_index "authentications", ["user_id"], :name => "index_authentications_on_user_id"
  add_index "authentications", ["user_name"], :name => "index_authentications_on_user_name"

  create_table "comments", :force => true do |t|
    t.integer  "owner_id",         :null => false
    t.integer  "commentable_id",   :null => false
    t.string   "commentable_type", :null => false
    t.text     "body",             :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "pins", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_remote_url"
    t.string   "youtube_url"
    t.string   "slug"
    t.string   "brand"
  end

  add_index "pins", ["brand"], :name => "index_pins_on_brand"
  add_index "pins", ["created_at"], :name => "index_pins_on_created_at"
  add_index "pins", ["description"], :name => "index_pins_on_description"
  add_index "pins", ["image_content_type"], :name => "index_pins_on_image_content_type"
  add_index "pins", ["image_file_name"], :name => "index_pins_on_image_file_name"
  add_index "pins", ["image_file_size"], :name => "index_pins_on_image_file_size"
  add_index "pins", ["image_remote_url"], :name => "index_pins_on_image_remote_url"
  add_index "pins", ["image_updated_at"], :name => "index_pins_on_image_updated_at"
  add_index "pins", ["slug"], :name => "index_pins_on_slug"
  add_index "pins", ["updated_at"], :name => "index_pins_on_updated_at"
  add_index "pins", ["user_id"], :name => "index_pins_on_user_id"
  add_index "pins", ["youtube_url"], :name => "index_pins_on_youtube_url"

  create_table "rates", :force => true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         :null => false
    t.string   "dimension"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "rates", ["rateable_id", "rateable_type"], :name => "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], :name => "index_rates_on_rater_id"

  create_table "rating_caches", :force => true do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            :null => false
    t.integer  "qty",            :null => false
    t.string   "dimension"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], :name => "index_rating_caches_on_cacheable_id_and_cacheable_type"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "role"
  end

  add_index "users", ["created_at"], :name => "index_users_on_created_at"
  add_index "users", ["current_sign_in_at"], :name => "index_users_on_current_sign_in_at"
  add_index "users", ["current_sign_in_ip"], :name => "index_users_on_current_sign_in_ip"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["encrypted_password"], :name => "index_users_on_encrypted_password"
  add_index "users", ["last_sign_in_at"], :name => "index_users_on_last_sign_in_at"
  add_index "users", ["last_sign_in_ip"], :name => "index_users_on_last_sign_in_ip"
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["remember_created_at"], :name => "index_users_on_remember_created_at"
  add_index "users", ["reset_password_sent_at"], :name => "index_users_on_reset_password_sent_at"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role"], :name => "index_users_on_role"
  add_index "users", ["sign_in_count"], :name => "index_users_on_sign_in_count"
  add_index "users", ["updated_at"], :name => "index_users_on_updated_at"

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "views", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "views", ["email"], :name => "index_views_on_email", :unique => true
  add_index "views", ["reset_password_token"], :name => "index_views_on_reset_password_token", :unique => true

end
