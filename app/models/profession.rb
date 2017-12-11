class Profession < ApplicationRecord
	belongs_to :domain
	has_many :projects, dependent: :destroy
	has_one :profile, dependent: :destroy

end
