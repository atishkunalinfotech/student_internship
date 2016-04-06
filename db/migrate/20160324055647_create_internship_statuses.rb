class CreateInternshipStatuses < ActiveRecord::Migration
  def change
    create_table :internship_statuses do |t|
      t.string :internship_status_name

      t.timestamps null: false
    end
  end
end
