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

ActiveRecord::Schema.define(version: 20170205230654) do

  create_table "admin_cities", force: :cascade do |t|
    t.string   "city_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "internship_type",         limit: 255
    t.string   "company_name",            limit: 255
    t.text     "address",                 limit: 65535
    t.string   "city",                    limit: 255
    t.string   "postal",                  limit: 255
    t.string   "country",                 limit: 255
    t.string   "contact_person_first",    limit: 255
    t.string   "contact_person_last",     limit: 255
    t.string   "contact_person_position", limit: 255
    t.string   "telephone",               limit: 255
    t.string   "email",                   limit: 255
    t.string   "company_website",         limit: 255
    t.text     "notes",                   limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "province",                limit: 255
  end

  create_table "educations", force: :cascade do |t|
    t.integer  "student_id",            limit: 4
    t.string   "degree_type",           limit: 255
    t.string   "major",                 limit: 255
    t.float    "degree_gpa",            limit: 24
    t.string   "degree_university",     limit: 255
    t.string   "degree_university_loc", limit: 255
    t.string   "certifications",        limit: 255
    t.string   "certification_body",    limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "position",              limit: 4
  end

  create_table "internship_statuses", force: :cascade do |t|
    t.string   "internship_status_name", limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "job_groups", force: :cascade do |t|
    t.string   "job_model_name", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "job_posts", force: :cascade do |t|
    t.integer  "job_id",     limit: 4
    t.integer  "company_id", limit: 4
    t.integer  "status",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "job_group_id",     limit: 4
    t.string   "job_name",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "description",      limit: 65535
    t.text     "responsibilities", limit: 65535
    t.text     "requirements",     limit: 65535
    t.string   "salary",           limit: 255
  end

  create_table "semester_registereds", force: :cascade do |t|
    t.string   "semester",     limit: 255
    t.string   "student_year", limit: 255
    t.integer  "student_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "skill_groups", force: :cascade do |t|
    t.string   "skill",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer  "skill_group_id", limit: 4
    t.string   "skill_name",     limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "student_job_interests", force: :cascade do |t|
    t.integer  "student_id",            limit: 4
    t.integer  "company_id",            limit: 4
    t.integer  "job_id",                limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.boolean  "select_profile_status",             default: false
    t.boolean  "reject_profile",                    default: false
    t.integer  "is_hire",               limit: 4,   default: 0
    t.string   "paid_status",           limit: 255
  end

  create_table "student_work_exps", force: :cascade do |t|
    t.integer  "student_id",       limit: 4
    t.string   "company",          limit: 255
    t.string   "company_location", limit: 255
    t.date     "dates_start"
    t.date     "date_end"
    t.string   "position",         limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "wposition",        limit: 4
  end

  create_table "students", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "studentid",              limit: 255
    t.string   "student_firstname",      limit: 255
    t.string   "student_middlename",     limit: 255
    t.string   "student_lastname",       limit: 255
    t.string   "student_email",          limit: 255
    t.string   "telephone",              limit: 255
    t.string   "gender",                 limit: 255
    t.string   "status",                 limit: 255
    t.string   "paid_status",            limit: 255
    t.integer  "internship_status_id",   limit: 4
    t.string   "country",                limit: 255
    t.string   "attachment",             limit: 255
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

  create_table "user_skills", force: :cascade do |t|
    t.integer  "student_id",  limit: 4
    t.integer  "skill_id",    limit: 4
    t.string   "skill_level", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "role",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
