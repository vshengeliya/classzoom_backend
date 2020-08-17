# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_17_212656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.time "time"
    t.text "description"
    t.string "zoom_url"
    t.bigint "classroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classroom_id"], name: "index_events_on_classroom_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "current_zoom_meeting_url"
    t.string "current_zoom_meeting_id"
    t.string "current_zoom_meeting_password"
    t.string "current_zoom_meeting_start_time"
    t.integer "current_zoom_meeting_duration"
  end

  create_table "teacher_students", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "teacher_id", null: false
    t.bigint "classroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["classroom_id"], name: "index_teacher_students_on_classroom_id"
    t.index ["student_id"], name: "index_teacher_students_on_student_id"
    t.index ["teacher_id"], name: "index_teacher_students_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "current_zoom_meeting_url"
    t.string "current_zoom_meeting_id"
    t.string "current_zoom_meeting_password"
    t.string "current_zoom_meeting_start_time"
    t.integer "current_zoom_meeting_duration"
  end

  add_foreign_key "events", "classrooms"
  add_foreign_key "teacher_students", "classrooms"
  add_foreign_key "teacher_students", "students"
  add_foreign_key "teacher_students", "teachers"
end
