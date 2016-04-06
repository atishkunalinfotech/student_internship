class CreateStudentJobInterests < ActiveRecord::Migration
  def change
    create_table :student_job_interests do |t|
      t.integer :student_id
      t.integer :company_id
      t.integer :job_id

      t.timestamps null: false
    end
  end
end
