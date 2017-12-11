class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
      t.text :content, null: false
      t.decimal     :amount
      t.string      :time_limit
      t.references  :currency,  index: true
      t.references  :time_unity, index: true
      t.references  :project, index: true, null: false
      t.references  :user, index: true,  null: false

      t.timestamps
    end
  end
end
