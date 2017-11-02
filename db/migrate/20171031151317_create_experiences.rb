class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
    	t.string		:company
    	t.string 		:position
    	t.date		:start_date, null: false	# Time period
    	t.date		:end_date, null: false	# Time period
      t.string    :country, null: false
    	t.boolean		:currently_working, default: false, null: false	# If currently working here (Y/N)
    	t.text			:task, null: false
    	t.references	:user # User_id
    	t.timestamps	null: false

      t.timestamps
    end
  end
end
