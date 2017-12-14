class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :content
      t.references :profession, index: true
      t.string :budget
      t.string :currency
      t.string :status
      t.string :priority
      t.boolean :published
      t.string :time_limit
      t.string :time_unity, index: true
      t.datetime :expire_at
      t.integer :view_number
      t.references :user, index: true
      t.string :slug, uniqueness: true

      t.timestamps
    end
  end
end
