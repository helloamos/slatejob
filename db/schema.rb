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

ActiveRecord::Schema.define(version: 20171105024713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attribute_projects", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.bigint "project_id"
    t.boolean "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_attribute_projects_on_project_id"
    t.index ["receiver_id"], name: "index_attribute_projects_on_receiver_id"
    t.index ["sender_id"], name: "index_attribute_projects_on_sender_id"
  end

  create_table "awards", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "conferring_organization"
    t.date "date_of_obtaining", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_awards_on_user_id"
  end

  create_table "bids", force: :cascade do |t|
    t.text "content"
    t.decimal "amount"
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_limit"
    t.integer "currency_id"
    t.integer "time_unity_id"
    t.index ["project_id"], name: "index_bids_on_project_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certifications", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "date_of_obtaining", null: false
    t.string "country", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_certifications_on_user_id"
  end

  create_table "comment_users", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.boolean "read", default: false
    t.date "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_comment_users_on_receiver_id"
    t.index ["sender_id"], name: "index_comment_users_on_sender_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "sender_id", null: false
    t.bigint "recipient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_conversations_on_recipient_id"
    t.index ["sender_id"], name: "index_conversations_on_sender_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "currency_symbol"
    t.string "iso_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "domains", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string "degree"
    t.string "school"
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "country", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "company"
    t.string "position"
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "country", null: false
    t.boolean "currently_working", default: false, null: false
    t.text "task", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "favoris_users", force: :cascade do |t|
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_favoris_users_on_receiver_id"
    t.index ["sender_id"], name: "index_favoris_users_on_sender_id"
  end

  create_table "like_users", force: :cascade do |t|
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_like_users_on_receiver_id"
    t.index ["sender_id"], name: "index_like_users_on_sender_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body", null: false
    t.integer "conversation_id"
    t.boolean "read", default: false
    t.bigint "user_id", null: false
    t.date "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.boolean "read", default: false
    t.date "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_notifications_on_receiver_id"
    t.index ["sender_id"], name: "index_notifications_on_sender_id"
  end

  create_table "professions", force: :cascade do |t|
    t.string "title"
    t.bigint "domain_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain_id"], name: "index_professions_on_domain_id"
  end

  create_table "project_skills", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_skills_on_project_id"
    t.index ["skill_id"], name: "index_project_skills_on_skill_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "profession_id"
    t.string "budget"
    t.bigint "currency_id"
    t.string "status"
    t.string "priority_id"
    t.boolean "published"
    t.string "time_limit"
    t.bigint "time_unity_id_id"
    t.datetime "expire_at"
    t.integer "view_number"
    t.bigint "user_id"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_projects_on_currency_id"
    t.index ["profession_id"], name: "index_projects_on_profession_id"
    t.index ["time_unity_id_id"], name: "index_projects_on_time_unity_id_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_unities", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_contacts", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "address"
    t.string "phone"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_user_contacts_on_user_id"
  end

  create_table "user_details", force: :cascade do |t|
    t.bigint "profession_id"
    t.text "presentation"
    t.boolean "availability"
    t.boolean "visibility"
    t.string "employment_type"
    t.string "facebook_link"
    t.string "twitter_link"
    t.string "linkedin_link"
    t.string "gplus_link"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profession_id"], name: "index_user_details_on_profession_id"
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "user_friends", force: :cascade do |t|
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_user_friends_on_receiver_id"
    t.index ["sender_id"], name: "index_user_friends_on_sender_id"
  end

  create_table "user_languages", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_languages_on_user_id"
  end

  create_table "user_skills", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.bigint "skill_id", null: false
    t.string "grade", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_user_skills_on_skill_id"
    t.index ["user_id"], name: "index_user_skills_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.string "login"
    t.string "profile_type"
    t.string "company_name"
    t.string "slug"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean "superadmin_role", default: false
    t.boolean "supervisor_role", default: false
    t.boolean "user_role", default: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
