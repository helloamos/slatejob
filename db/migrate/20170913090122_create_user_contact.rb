class CreateUserContact < ActiveRecord::Migration[5.1]
  def change
    create_table :user_contacts do |t|
    	t.string :country
  		t.string :city
  		t.string :address
  		t.string :phone

  		t.references :user
  		t.timestamps null: false
    end
  end
end
