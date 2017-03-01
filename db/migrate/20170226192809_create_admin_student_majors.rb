class CreateAdminStudentMajors < ActiveRecord::Migration
  def change
    create_table :admin_student_majors do |t|
      t.string :major_name

      t.timestamps null: false
    end
  end
end
