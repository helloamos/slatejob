class CreateProfile < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|

    	# Basic infos
    	t.string               :full_name
    	t.string               :company_name
    	t.references		   :profession, index: true
  		t.text   		       :presentation
  		t.boolean 		       :availability
  		t.boolean 		       :visibility
      t.string               :employment_type

    	# Social links
    	t.string          	    :facebook_link
    	t.string          	    :twitter_link
    	t.string          	    :linkedin_link
    	t.string          	    :gplus_link
    	#t.attachment      	    :avatar

      	# Contacts
  		t.string                :address
  		t.string                :phone
  		t.string                :country
  		t.string                :city

        t.float                 :latitude
        t.float                 :longitude 

  		t.references      	:user, index: true, null: false
  		t.timestamps 
  	end    
  end
end
