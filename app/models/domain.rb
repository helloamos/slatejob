class Domain < ApplicationRecord
	has_many :professions, dependent: :destroy
end
