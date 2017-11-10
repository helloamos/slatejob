class Category < ApplicationRecord
	has_many :projects, dependent: :destroy
	has_many :skills, dependent: :destroy

	scope :search, -> (title) { where("title = ?", "#{title}")}
end
