class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|
      t.integer :student_id
      t.integer :skill_id
      t.string :skill_level

      t.timestamps null: false
    end
  end
end
