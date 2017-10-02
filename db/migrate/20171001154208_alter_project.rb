class AlterProject < ActiveRecord::Migration[5.1]
  	def change
  		add_column :projects, :time_limit, :string
  		add_column :projects, :time_unity_id, :integer, index: true
	end

end
