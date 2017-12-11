class CreateAttribution < ActiveRecord::Migration[5.1]
  def change
    create_table :attributions do |t|
    	t.references :sender, index: true
    	t.references :receiver, index: true
    	t.references :project, index: true
    	t.references :bid, index: true
    	t.boolean    :accepted
    	t.timestamps 
    end
  end
end
