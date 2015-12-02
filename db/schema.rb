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

ActiveRecord::Schema.define(version: 20151130220731) do

  create_table "buildings", force: :cascade do |t|
    t.string   "building_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "classroom_timings", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "room_id"
    t.integer  "time_slot_id"
    t.integer  "day_combination_id"
    t.integer  "semester_id"
  end

  add_index "classroom_timings", ["day_combination_id"], name: "index_classroom_timings_on_day_combination_id"
  add_index "classroom_timings", ["room_id"], name: "index_classroom_timings_on_room_id"
  add_index "classroom_timings", ["semester_id"], name: "index_classroom_timings_on_semester_id"
  add_index "classroom_timings", ["time_slot_id"], name: "index_classroom_timings_on_time_slot_id"

  create_table "course_assignments", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "faculty_id"
    t.integer  "course_id"
    t.integer  "room_id"
    t.integer  "day_combination_id"
    t.integer  "time_slot_id"
    t.integer  "semester_id"
  end

  add_index "course_assignments", ["course_id"], name: "index_course_assignments_on_course_id"
  add_index "course_assignments", ["day_combination_id"], name: "index_course_assignments_on_day_combination_id"
  add_index "course_assignments", ["faculty_id"], name: "index_course_assignments_on_faculty_id"
  add_index "course_assignments", ["room_id"], name: "index_course_assignments_on_room_id"
  add_index "course_assignments", ["semester_id"], name: "index_course_assignments_on_semester_id"
  add_index "course_assignments", ["time_slot_id"], name: "index_course_assignments_on_time_slot_id"

  create_table "courses", force: :cascade do |t|
    t.string   "course_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "CourseTitle"
  end

  create_table "day_combinations", force: :cascade do |t|
    t.string   "day_combination"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "faculty_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "faculty_courses", force: :cascade do |t|
    t.integer  "course1_id"
    t.integer  "course2_id"
    t.integer  "course3_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "faculty_id"
    t.integer  "semester_id"
  end

  add_index "faculty_courses", ["faculty_id"], name: "index_faculty_courses_on_faculty_id"
  add_index "faculty_courses", ["semester_id"], name: "index_faculty_courses_on_semester_id"

  create_table "faculty_preferences", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "faculty_course_id"
    t.integer  "preference1_id"
    t.integer  "preference2_id"
    t.integer  "preference3_id"
    t.integer  "semester_id"
  end

  add_index "faculty_preferences", ["faculty_course_id"], name: "index_faculty_preferences_on_faculty_course_id"
  add_index "faculty_preferences", ["preference1_id"], name: "index_faculty_preferences_on_preference1_id"
  add_index "faculty_preferences", ["preference2_id"], name: "index_faculty_preferences_on_preference2_id"
  add_index "faculty_preferences", ["preference3_id"], name: "index_faculty_preferences_on_preference3_id"
  add_index "faculty_preferences", ["semester_id"], name: "index_faculty_preferences_on_semester_id"

  create_table "preferences", force: :cascade do |t|
    t.text     "note"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "building_id"
    t.integer  "day_combination_id"
    t.integer  "time_slot_id"
    t.integer  "semester_id"
  end

  add_index "preferences", ["building_id"], name: "index_preferences_on_building_id"
  add_index "preferences", ["day_combination_id"], name: "index_preferences_on_day_combination_id"
  add_index "preferences", ["semester_id"], name: "index_preferences_on_semester_id"
  add_index "preferences", ["time_slot_id"], name: "index_preferences_on_time_slot_id"

  create_table "rooms", force: :cascade do |t|
    t.string   "room_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "building_id"
    t.integer  "Capacity"
  end

  add_index "rooms", ["building_id"], name: "index_rooms_on_building_id"

  create_table "semesters", force: :cascade do |t|
    t.string   "SemesterTitle"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "time_ranges", force: :cascade do |t|
    t.string   "t_range"
    t.string   "t_slots"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "day_combination_id"
  end

  add_index "time_ranges", ["day_combination_id"], name: "index_time_ranges_on_day_combination_id"

  create_table "time_slots", force: :cascade do |t|
    t.string   "time_slot"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "day_combination_id"
  end

  add_index "time_slots", ["day_combination_id"], name: "index_time_slots_on_day_combination_id"

end
