class AddStudentCountryToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :student_country, :boolean, :default => false
  end
end
