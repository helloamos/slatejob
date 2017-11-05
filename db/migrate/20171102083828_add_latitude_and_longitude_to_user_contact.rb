class AddLatitudeAndLongitudeToUserContact < ActiveRecord::Migration[5.1]
  def change
    add_column :user_contacts, :latitude, :float
    add_column :user_contacts, :longitude, :float
  end
end
