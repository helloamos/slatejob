class UserDetail < ApplicationRecord
	belongs_to :user, :dependent => :destroy
	belongs_to :profession
	
end