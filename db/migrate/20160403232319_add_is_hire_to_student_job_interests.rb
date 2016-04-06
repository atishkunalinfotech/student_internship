class AddIsHireToStudentJobInterests < ActiveRecord::Migration
  def change
    add_column :student_job_interests, :is_hire, :integer, :default => 0
  end
end
