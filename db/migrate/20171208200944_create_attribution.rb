class CreateAttribution < ActiveRecord::Migration[5.1]
  def change
    create_table :attributions do |t|
    	t.references :sender, index: true, null: false
    	t.references :recipient, index: true, null: false
    	t.references :project, index: true, null: false
    	t.references :bid, index: true, null: false
    	t.boolean    :accepted
    	t.timestamps 
    end
  end
end
