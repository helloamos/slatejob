class CreateAttributeProject < ActiveRecord::Migration[5.1]
  def change
    create_table :attribute_projects do |t|
    	t.references :sender, index: true, :null => false
    	t.references :receiver, :index => true, :null => false
    	t.references :project
    	t.boolean    :accepted
    	t.timestamps :null => false
    end
  end
end
