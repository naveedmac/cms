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

ActiveRecord::Schema.define(version: 20171129013158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "school_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_cohorts_on_course_id"
    t.index ["school_id"], name: "index_cohorts_on_school_id"
    t.index ["student_id"], name: "index_cohorts_on_student_id"
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

  create_table "instructors", force: :cascade do |t|
    t.string "first_name", limit: 30
    t.string "middle_name", limit: 30
    t.string "last_name", limit: 40
    t.text "about_me"
    t.string "telephone_no", limit: 30
    t.string "email", limit: 40
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_instructors_on_user_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "title", limit: 30
    t.text "description"
    t.text "file_link"
    t.text "instructions"
    t.bigint "user_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_materials_on_topic_id"
    t.index ["user_id"], name: "index_materials_on_user_id"
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

  create_table "students", force: :cascade do |t|
    t.string "first_name", limit: 40
    t.string "middle_name", limit: 40
    t.string "last_name", limit: 40
    t.text "about_me"
    t.string "telephone_no", limit: 20
    t.string "email", limit: 40
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title", limit: 30
    t.text "description"
    t.integer "no_of_hours_required"
    t.integer "percentage_completed"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_topics_on_course_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.string "title", limit: 30
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 30
    t.string "password_digest"
    t.text "secret_question_1"
    t.string "answer_1_digest"
    t.text "secret_question_2"
    t.string "answer_2_digest"
    t.bigint "user_type_id"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_users_on_school_id"
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  add_foreign_key "cohorts", "courses"
  add_foreign_key "cohorts", "schools"
  add_foreign_key "cohorts", "students"
  add_foreign_key "courses", "users"
  add_foreign_key "instructors", "users"
  add_foreign_key "materials", "topics"
  add_foreign_key "materials", "users"
  add_foreign_key "students", "users"
  add_foreign_key "topics", "courses"
  add_foreign_key "users", "schools"
  add_foreign_key "users", "user_types"
end
