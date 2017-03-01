class CreateStudentCities < ActiveRecord::Migration
  def change
    create_table :student_cities do |t|
      t.string :student_city_name
      t.integer :country_id

      t.timestamps null: false
    end
  end
end
