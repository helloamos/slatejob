class AlterUser < ActiveRecord::Migration[5.1]
  def change
  	change_table :users do |t|
  		
  		t.string :user_name
  		t.string :login, uniqueness: true
  		t.string :profile_type
  		t.string :company_name
        t.string :slug, unique: true
        t.attachment      :avatar
        
        # Roles
        t.boolean :superadmin_role, default: false
        t.boolean :supervisor_role,  default: false
        t.boolean :user_role,  default: true
     
  	end
  end
end
