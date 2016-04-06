class AddPaidStatusToStudentJobInterests < ActiveRecord::Migration
  def change
    add_column :student_job_interests, :paid_status, :string
  end
end
