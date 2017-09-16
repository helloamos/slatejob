class UserDetail < ApplicationRecord
	belongs_to :user, :dependent => :destroy
	
end