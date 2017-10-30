class CreateConversation < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
    	t.references :sender, index: true, :null => false
    	t.references :recipient, :index => true, :null => false
    	t.timestamps 
    end
  end
end
