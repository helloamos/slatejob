class Currency < ApplicationRecord
	has_many :projects
	validates :currency_symbol, presence: true, uniqueness: true
	validates :iso_code, presence: true, uniqueness: true
end
