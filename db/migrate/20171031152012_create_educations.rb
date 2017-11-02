class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.string 		:degree
      t.string 		:school
	  t.string 		:start_date, null: false
	  t.string 		:end_date, null: false
	  t.string 		:country, null: false
      t.references 	:user, null: false # User_ID
    	
      t.timestamps
    end
  end
end
