class Category < ApplicationRecord
	has_many :projects
	has_many :skills

	scope :search, -> (title) { where("title = ?", "#{title}")}
end
