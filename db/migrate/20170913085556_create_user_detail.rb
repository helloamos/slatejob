class CreateUserDetail < ActiveRecord::Migration[5.1]
  def change
    create_table		    :user_details do |t|
    	t.string		      :specialization
  		t.text   		      :presentation
  		t.string 		      :availability
  		t.string 		      :visibility


      # Ref & timestamps.
  		t.references      :user
  		t.timestamps      null: false
    end
  end
end
