class AddWpositionToStudentWorkExps < ActiveRecord::Migration
  def change
    add_column :student_work_exps, :wposition, :integer
  end
end
