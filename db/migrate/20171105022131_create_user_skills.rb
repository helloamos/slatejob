class CreateUserSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :user_skills do |t|
      t.string :title
      t.references :user, null: false 
      t.references :skill, null: false
      t.string :grade, null: false

      t.timestamps
    end
  end
end
