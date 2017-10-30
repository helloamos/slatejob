class CreateMessage < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
    	t.text :body, :null => false
    	t.integer :conversation_id
    	t.boolean :read, :default => false
    	t.references :user, :index => true, :null => false
    	t.date :read_at
    	t.timestamps 
    end
  end
end
