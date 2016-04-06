class CreateAdminCities < ActiveRecord::Migration
  def change
    create_table :admin_cities do |t|
      t.string :city_name

      t.timestamps null: false
    end
  end
end
