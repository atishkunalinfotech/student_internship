class AddRejectProfileToStudentJobInterests < ActiveRecord::Migration
  def change
    add_column :student_job_interests, :reject_profile, :boolean, :default => false
  end
end
