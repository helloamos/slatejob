class CreateUserLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :user_languages do |t|
      t.string :title
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
