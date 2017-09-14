class Subscription < ApplicationRecord
	validates :email, uniqueness: true
end
