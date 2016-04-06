class CreateSkillGroups < ActiveRecord::Migration
  def change
    create_table :skill_groups do |t|
      t.string :skill

      t.timestamps null: false
    end
  end
end
