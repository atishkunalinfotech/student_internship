class AddStudentIdToStudentCertifications < ActiveRecord::Migration
  def change
    add_column :student_certifications, :student_id, :integer
  end
end
