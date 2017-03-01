class AddStudentCityToStudentDegrees < ActiveRecord::Migration
  def change
    add_column :student_degrees, :student_city_id, :integer
  end
end
