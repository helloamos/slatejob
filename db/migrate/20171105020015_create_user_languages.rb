class CreateUserLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :user_languages do |t|
      t.string :title
      t.references :user, null: false

      t.timestamps
    end
  end
end
