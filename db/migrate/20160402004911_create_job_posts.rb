class CreateJobPosts < ActiveRecord::Migration
  def change
    create_table :job_posts do |t|
      t.integer :job_id
      t.integer :company_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
