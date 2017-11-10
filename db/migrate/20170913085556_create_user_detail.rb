class CreateUserDetail < ActiveRecord::Migration[5.1]
  def change
    create_table		    :user_details do |t|
    	t.references		  :profession
  		t.text   		      :presentation
  		t.boolean 		    :availability
  		t.boolean 		    :visibility
      t.string          :employment_type
      t.string          :facebook_link
      t.string          :twitter_link
      t.string          :linkedin_link
      t.string          :gplus_link


      # Ref & timestamps.
  		t.references      :user
  		t.timestamps      null: false
    end
  end
end
