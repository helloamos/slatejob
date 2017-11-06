class Profession < ApplicationRecord
	belongs_to :domain
	has_many :projects

end
