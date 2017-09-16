class UserContact < ApplicationRecord
	belongs_to :user,  :dependent => :destroy
end