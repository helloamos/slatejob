class AlterProject < ActiveRecord::Migration[5.1]
  def up
  	remove_column :projects, :time_limit
  end

  def down
  	add_column :projects, :time_limit, :datetime
  end
end
