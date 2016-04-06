class AddCountryToStudents < ActiveRecord::Migration
  def change
    add_column :students, :country, :string
  end
end
