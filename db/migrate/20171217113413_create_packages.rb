class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :title
      t.bigint :amount
      t.bigint :bid


      t.timestamps
    end
  end
end
