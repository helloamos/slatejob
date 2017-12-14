class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
      t.text :content, null: false
      t.decimal     :amount
      t.integer      :time_limit
      t.string  :currency
      t.string  :time_unity
      t.references  :project, index: true
      t.references  :user, index: true

      t.timestamps
    end
  end
end
