class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :student_id
      t.string :degree_type
      t.string :major
      t.float :degree_gpa
      t.string :degree_university
      t.string :degree_university_loc
      t.string :certifications
      t.string :certification_body

      t.timestamps null: false
    end
  end
end
