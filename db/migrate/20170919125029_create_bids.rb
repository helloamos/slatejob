class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
      t.text :content
      t.decimal :amount
      t.datetime :time_limit

      t.references :project
      t.references :user

      t.timestamps
    end
  end
end
