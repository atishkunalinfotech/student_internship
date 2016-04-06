class AddDescriptionToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :description, :text
    add_column :jobs, :responsibilities, :text
    add_column :jobs, :requirements, :text
    add_column :jobs, :salary, :string
  end
end
