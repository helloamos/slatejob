class AlterUser < ActiveRecord::Migration[5.1]
  def change
  	change_table :users do |t|
  		
  		t.string :user_name
  		t.string :login, uniqueness: true
  		t.string :profile_type
  		t.string :company_name
  		t.string :specialization
  		t.text :presentation
  		t.string :availability
  		t.string :visibility
  		t.string :country
  		t.string :city
  		t.string :address
  		t.string :phone
  		t.string :slug, uniqueness: true

  	end
  end
end
