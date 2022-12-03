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

ActiveRecord::Schema.define(version: 2022_12_03_165725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", primary_key: "achievement_id", id: :serial, force: :cascade do |t|
    t.string "name_achievement", limit: 30
    t.integer "bonus"
    t.index ["name_achievement"], name: "uniq_achievement", unique: true
  end

  create_table "applicant_achievements", primary_key: "applicant_achievement_id", id: :serial, force: :cascade do |t|
    t.integer "applicant_id"
    t.integer "achievement_id"
  end

  create_table "applicant_subjects", primary_key: "applicant_subject_id", id: :serial, force: :cascade do |t|
    t.integer "applicant_id"
    t.integer "subject_id"
    t.integer "result"
  end

  create_table "applicants", primary_key: "applicant_id", id: :serial, force: :cascade do |t|
    t.string "name_applicant", limit: 50
    t.index ["name_applicant"], name: "uniq_applicant", unique: true
  end

  create_table "departments", primary_key: "department_id", id: :serial, force: :cascade do |t|
    t.string "name_department", limit: 30
    t.index ["name_department"], name: "uniq_department", unique: true
  end

  create_table "program_applicants", primary_key: "program_applicant_id", id: :serial, force: :cascade do |t|
    t.integer "program_id"
    t.integer "applicant_id"
  end

  create_table "program_subjects", primary_key: "program_subject_id", id: :serial, force: :cascade do |t|
    t.integer "program_id"
    t.integer "subject_id"
    t.integer "min_result"
  end

  create_table "programs", primary_key: "program_id", id: :serial, force: :cascade do |t|
    t.text "name_program"
    t.integer "department_id"
    t.integer "plan"
    t.index ["name_program"], name: "uniq_program", unique: true
  end

  create_table "subjects", primary_key: "subject_id", id: :serial, force: :cascade do |t|
    t.string "name_subject", limit: 30
    t.index ["name_subject"], name: "uniq_subject", unique: true
  end

  add_foreign_key "applicant_achievements", "achievements", primary_key: "achievement_id", name: "applicant_achievements_achievement_id_fkey", on_delete: :cascade
  add_foreign_key "applicant_achievements", "applicants", primary_key: "applicant_id", name: "applicant_achievements_applicant_id_fkey", on_delete: :cascade
  add_foreign_key "applicant_subjects", "applicants", primary_key: "applicant_id", name: "applicant_subjects_applicant_id_fkey", on_delete: :cascade
  add_foreign_key "applicant_subjects", "subjects", primary_key: "subject_id", name: "applicant_subjects_subject_id_fkey", on_delete: :cascade
  add_foreign_key "program_applicants", "applicants", primary_key: "applicant_id", name: "program_applicants_applicant_id_fkey", on_delete: :cascade
  add_foreign_key "program_applicants", "programs", primary_key: "program_id", name: "program_applicants_program_id_fkey", on_delete: :cascade
  add_foreign_key "program_subjects", "programs", primary_key: "program_id", name: "program_subjects_program_id_fkey", on_delete: :cascade
  add_foreign_key "program_subjects", "subjects", primary_key: "subject_id", name: "program_subjects_subject_id_fkey", on_delete: :cascade
  add_foreign_key "programs", "departments", primary_key: "department_id", name: "programs_department_id_fkey", on_delete: :cascade
end
