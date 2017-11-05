class UserContact < ApplicationRecord
	belongs_to :user,  :dependent => :destroy

	# Geocoder requirements.
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
	#after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	# For reverse geocoding
	#reverse_geocoded_by :latitude, :longitude #, :address => :full_address
	#after_validation :reverse_geocode

	
end