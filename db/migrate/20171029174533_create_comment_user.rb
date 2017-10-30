class CreateCommentUser < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_users do |t|
    	t.text :content, :null => false
    	t.references :sender, :index => true, :null => false
    	t.references :receiver, :index => true, :null => false
    	t.boolean :read, :default => false
    	t.date :read_at
    	t.timestamps :null => false
    end
  end
end
