class AddStudentFieldToStudents < ActiveRecord::Migration
  def change
    add_column :students, :studentid, :string
    add_column :students, :student_firstname, :string
    add_column :students, :student_middlename, :string
    add_column :students, :student_lastname, :string
    add_column :students, :student_email, :string
    add_column :students, :telephone, :string
    add_column :students, :gender, :string
    add_column :students, :status, :string
  end
end
