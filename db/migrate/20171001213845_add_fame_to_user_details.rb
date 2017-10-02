class AddFameToUserDetails < ActiveRecord::Migration[5.1]
  def change
  	add_column :user_details, :fame, :float
  end
end
