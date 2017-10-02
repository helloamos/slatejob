class CreateTimeUnities < ActiveRecord::Migration[5.1]
  def change
    create_table :time_unities do |t|
      t.string :title

      t.timestamps
    end
  end
end
