class CreateStudentCertifications < ActiveRecord::Migration
  def change
    create_table :student_certifications do |t|
      t.string :certification
      t.string :major
      t.string :institution
      t.integer :country_id
      t.string :grade

      t.timestamps null: false
    end
  end
end
