class CreateStudentWorkExps < ActiveRecord::Migration
  def change
    create_table :student_work_exps do |t|
      t.integer :student_id
      t.string :company
      t.string :company_location
      t.date :dates_start
      t.date :date_end
      t.string :position

      t.timestamps null: false
    end
  end
end
