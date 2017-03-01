class CreateStudentDegrees < ActiveRecord::Migration
  def change
    create_table :student_degrees do |t|
      t.string :degree
      t.string :major
      t.integer :student_university_id
      t.integer :country_id
      t.string :college
      t.string :gpa
      t.string :garduation_year
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
