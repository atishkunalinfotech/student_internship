class AddOtherMajorToStudentDegrees < ActiveRecord::Migration
  def change
    add_column :student_degrees, :other_major, :string
  end
end
