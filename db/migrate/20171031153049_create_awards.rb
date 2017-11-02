class CreateAwards < ActiveRecord::Migration[5.1]
  def change
    create_table :awards do |t|
      	t.string 		:title
      	t.text 			:description
    	t.string		:conferring_organization
    	t.string 		:date_of_obtaining, null: false
    	t.references 	:user, null: false

      	t.timestamps
    end
  end
end
