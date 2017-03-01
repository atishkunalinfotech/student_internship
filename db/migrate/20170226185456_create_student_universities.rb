class CreateStudentUniversities < ActiveRecord::Migration
  def change
    create_table :student_universities do |t|
      t.integer :country_id
      t.string :university_name

      t.timestamps null: false
    end
  end
end
