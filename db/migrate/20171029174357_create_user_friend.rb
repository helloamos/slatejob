class CreateUserFriend < ActiveRecord::Migration[5.1]
  def change
    create_table :user_friends do |t|
    	t.references :sender, index: true, :null => false
    	t.references :receiver, :index => true, :null => false
    	t.timestamps :null => false
    end
  end
end
