class AddCountryIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :country_id, :integer
  end
end
