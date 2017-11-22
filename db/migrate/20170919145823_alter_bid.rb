class AlterBid < ActiveRecord::Migration[5.1]
  def up
  	#add_column :bids, :time_limit, :string
  	add_column :bids, :currency_id, :integer, index: true
  	add_column :bids, :time_unity_id, :integer, index: true
  end

  def down
  	remove_column :bids, :time_unity_id
  	remove_column :bids, :currency_id
  	#remove_column :bids, :time_limit
  	
  end
end
