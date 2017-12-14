class CreateBudget < ActiveRecord::Migration[5.1]
  def change
    create_table :budgets do |t|
    	t.string :title
    end
  end
end
