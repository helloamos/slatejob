class AlterBid < ActiveRecord::Migration[5.1]
  def up
  	remove_column :bids, :time_limit
  end

  def down
  	add_column :bids, :time_limit, :datetime
  	add_column :bids, :currency_id, :integer, index: true
  end
end
