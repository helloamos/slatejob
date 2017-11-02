class CreateCertifications < ActiveRecord::Migration[5.1]
  def change
    create_table :certifications do |t|
    	t.string 		:title
		t.text	 		:description
    	t.string 		:date_of_obtaining, null: false
    	t.string    	:country, null: false
    	t.references 	:user, null: false
      	t.timestamps
    end
  end
end
