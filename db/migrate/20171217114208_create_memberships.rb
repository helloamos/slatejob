class CreateMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :memberships do |t|
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.bigint :total_bid, default: 0
      t.bigint :remaining_bid, default: 0
      t.string :status, default: "disable"

      t.references :package, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
  end
end
