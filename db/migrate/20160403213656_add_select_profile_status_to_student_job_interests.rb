class AddSelectProfileStatusToStudentJobInterests < ActiveRecord::Migration
  def change
    add_column :student_job_interests, :select_profile_status, :boolean, :default => false
  end
end
