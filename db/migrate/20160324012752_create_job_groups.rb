class CreateJobGroups < ActiveRecord::Migration
  def change
    create_table :job_groups do |t|
      t.string :job_model_name

      t.timestamps null: false
    end
  end
end
