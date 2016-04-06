class CreateSemesterRegistereds < ActiveRecord::Migration
  def change
    create_table :semester_registereds do |t|
      t.string :semester
      t.string :student_year
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
