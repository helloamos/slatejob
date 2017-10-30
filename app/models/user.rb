class User < ApplicationRecord
	# For FriendlyID
	extend FriendlyId
	friendly_id :login, use: :slugged

	# Include default devise modules. Others available are:
	devise :database_authenticatable, :registerable,
	 :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable, :omniauthable,  omniauth_providers: [:facebook, :google_oauth2]

	# User profile type
	PROFILE_TYPE = [["Freelance"],["Employeur"]]
	VISIBILITY = [["Oui"],["Non"]]
	AVAILABILITY = [["Plein temps"],["Temps partiel"]]

	# Date validation
	validates :login, presence: true, uniqueness: true
	validates :profile_type, presence: true
	validates :company_name, uniqueness: true, if: 'company_name.present?'
	validates :slug,  uniqueness: true
	validates :email, uniqueness: true

	# Relationships
	has_one :user_detail
	has_one :user_contact
	has_many :projects
	has_many :bids
	

	# Paperclip usage
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/avatar/:style/missing.png",  validate_media_type: false
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


end
