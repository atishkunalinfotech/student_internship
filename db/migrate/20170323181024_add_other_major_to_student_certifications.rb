class AddOtherMajorToStudentCertifications < ActiveRecord::Migration
  def change
    add_column :student_certifications, :other_major, :string
  end
end
