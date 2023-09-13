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

ActiveRecord::Schema[7.0].define(version: 2023_09_12_185641) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "directors", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "director_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "user_id"
    t.index ["group_id"], name: "index_groups_users_on_group_id"
    t.index ["user_id"], name: "index_groups_users_on_user_id"
  end

  create_table "jobplaces", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobplaces_users", force: :cascade do |t|
    t.bigint "jobplace_id"
    t.bigint "user_id"
    t.index ["jobplace_id"], name: "index_jobplaces_users_on_jobplace_id"
    t.index ["user_id"], name: "index_jobplaces_users_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs_users", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "user_id"
    t.index ["job_id"], name: "index_jobs_users_on_job_id"
    t.index ["user_id"], name: "index_jobs_users_on_user_id"
  end

  create_table "professions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professions_users", force: :cascade do |t|
    t.bigint "profession_id"
    t.bigint "user_id"
    t.index ["profession_id"], name: "index_professions_users_on_profession_id"
    t.index ["user_id"], name: "index_professions_users_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responsibilities", force: :cascade do |t|
    t.string "description"
    t.integer "jobs_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "groups", "directors"
  add_foreign_key "groups_users", "groups"
  add_foreign_key "groups_users", "users"
  add_foreign_key "jobplaces_users", "jobplaces"
  add_foreign_key "jobplaces_users", "users"
  add_foreign_key "jobs_users", "jobs"
  add_foreign_key "jobs_users", "users"
  add_foreign_key "professions_users", "professions"
  add_foreign_key "professions_users", "users"
end
