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

ActiveRecord::Schema.define(version: 20171205214220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["course_id"], name: "index_cohorts_on_course_id"
    t.index ["user_id"], name: "index_cohorts_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title", limit: 80
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "title", limit: 30
    t.text "description"
    t.text "file_link"
    t.text "instructions"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url_link"
    t.index ["topic_id"], name: "index_materials_on_topic_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", limit: 30
    t.text "description"
    t.string "address"
    t.string "city"
    t.integer "province"
    t.integer "country_id"
    t.string "postal_code"
    t.string "telephone"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "title", limit: 40
    t.text "description"
    t.integer "no_of_hours_required"
    t.integer "percentage_completed"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_topics_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 30
    t.string "password_digest"
    t.text "secret_question_1"
    t.string "answer_1_digest"
    t.text "secret_question_2"
    t.string "answer_2_digest"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "about_me"
    t.string "address"
    t.string "telephone"
    t.boolean "is_admin", default: false
    t.index ["school_id"], name: "index_users_on_school_id"
  end

  add_foreign_key "cohorts", "courses"
  add_foreign_key "cohorts", "users"
  add_foreign_key "courses", "users"
  add_foreign_key "materials", "topics"
  add_foreign_key "topics", "courses"
  add_foreign_key "users", "schools"
end
