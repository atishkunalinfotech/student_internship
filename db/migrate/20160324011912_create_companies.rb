class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :internship_type
      t.string :company_name
      t.text :address
      t.string :city
      t.string :postal
      t.string :country
      t.string :contact_person_first
      t.string :contact_person_last
      t.string :contact_person_position
      t.string :telephone
      t.string :email
      t.string :company_website
      t.text :notes

      t.timestamps null: false
    end
  end
end
