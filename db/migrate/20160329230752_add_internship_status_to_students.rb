class AddInternshipStatusToStudents < ActiveRecord::Migration
  def change
    add_column :students, :internship_status_id, :integer
  end
end
