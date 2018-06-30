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

ActiveRecord::Schema.define(version: 2018_06_30_151245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activities", id: :serial, force: :cascade do |t|
    t.string "trackable_type"
    t.integer "trackable_id"
    t.string "owner_type"
    t.integer "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.integer "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
  end

  create_table "attendances", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
  end

  create_table "charges", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coachprofile_id"
    t.integer "user_id"
    t.integer "amount"
    t.index ["coachprofile_id"], name: "index_charges_on_coachprofile_id"
    t.index ["user_id"], name: "index_charges_on_user_id"
  end

  create_table "chat_rooms", id: :serial, force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "coach_id"
    t.index ["user_id"], name: "index_chat_rooms_on_user_id"
  end

  create_table "coaches", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coachprofiles", id: :serial, force: :cascade do |t|
    t.datetime "birthdate"
    t.string "sport"
    t.integer "price"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coach_id"
    t.string "phonenumber"
    t.boolean "location"
    t.string "address"
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.string "email"
    t.string "image"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", id: :serial, force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id", "sender_id"], name: "index_conversations_on_recipient_id_and_sender_id", unique: true
    t.index ["recipient_id"], name: "index_conversations_on_recipient_id"
    t.index ["sender_id"], name: "index_conversations_on_sender_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.string "address"
    t.string "sport"
    t.integer "need"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "attendance_id"
    t.string "time"
    t.boolean "privacy"
    t.text "description"
  end

  create_table "follows", id: :serial, force: :cascade do |t|
    t.string "followable_type", null: false
    t.integer "followable_id", null: false
    t.string "follower_type", null: false
    t.integer "follower_id", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
  end

  create_table "games", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "sport"
    t.text "description"
    t.string "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "group_memberships", id: :serial, force: :cascade do |t|
    t.string "member_type", null: false
    t.integer "member_id", null: false
    t.string "group_type"
    t.integer "group_id"
    t.string "group_name"
    t.string "membership_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_name"], name: "index_group_memberships_on_group_name"
    t.index ["group_type", "group_id"], name: "index_group_memberships_on_group_type_and_group_id"
    t.index ["member_type", "member_id"], name: "index_group_memberships_on_member_type_and_member_id"
  end

  create_table "groups", id: :serial, force: :cascade do |t|
    t.string "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "descriptions"
    t.string "sport"
    t.string "name"
    t.string "location"
  end

  create_table "instaconvos", id: :serial, force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_instaconvos_on_recipient_id"
    t.index ["sender_id"], name: "index_instaconvos_on_sender_id"
  end

  create_table "instamessages", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "conversation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_instamessages_on_conversation_id"
    t.index ["user_id"], name: "index_instamessages_on_user_id"
  end

  create_table "invites", id: :serial, force: :cascade do |t|
    t.string "email"
    t.integer "event_id"
    t.integer "sender_id"
    t.integer "recipient_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
  end

  create_table "leagues", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "num_teams"
    t.string "sport"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "chat_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "description"
  end

  create_table "photos", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "user_id"
    t.integer "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "players", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "users_id"
    t.index ["users_id"], name: "index_players_on_users_id"
  end

  create_table "profiles", id: :serial, force: :cascade do |t|
    t.integer "age"
    t.string "address"
    t.text "description"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sport"
    t.integer "skill"
    t.text "sportdescription"
    t.integer "user_id"
    t.string "image"
    t.string "displayname"
    t.string "string"
    t.string "phonenumber"
    t.integer "rating"
    t.integer "wins"
  end

  create_table "ratings", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", id: :serial, force: :cascade do |t|
    t.text "description"
    t.integer "rating"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "coachprofile_id"
  end

  create_table "supamessages", id: :serial, force: :cascade do |t|
    t.text "body"
    t.integer "instaconvo_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instaconvo_id"], name: "index_supamessages_on_instaconvo_id"
    t.index ["user_id"], name: "index_supamessages_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "type"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "lastname"
    t.string "gender"
    t.string "preferredsport"
    t.string "firstname"
    t.integer "event_id"
    t.string "createdevents"
    t.string "integer"
    t.integer "attendance_id"
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.integer "notification_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "chat_rooms", "users"
  add_foreign_key "games", "users"
  add_foreign_key "instamessages", "conversations"
  add_foreign_key "instamessages", "users"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "players", "users", column: "users_id"
  add_foreign_key "supamessages", "instaconvos"
  add_foreign_key "supamessages", "users"
end
