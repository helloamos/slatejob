class User < ApplicationRecord
	# For FriendlyID
	extend FriendlyId
	friendly_id :login, use: :slugged

	# Include default devise modules. Others available are:
	devise :database_authenticatable, :registerable,
	 :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable, :omniauthable,  omniauth_providers: [:facebook, :google_oauth2]

	# User profile type
	PROFILE_TYPE = [["Freelance"],["Employeur"]]
	EMPLOYMENT_TYPE = [["Plein temps"],["Temps partiel"], ["Contrat"]]

	# Date validation
	validates :login, presence: true, uniqueness: true
	validates :profile_type, presence: true
	#validates :company_name, uniqueness: true, if: 'company_name.present?'
	validates :slug,  uniqueness: true
	validates :email, uniqueness: true

	# Relationships
	has_one :user_detail, :dependent => :destroy
	has_one :user_contact
	has_many :projects, dependent: :destroy
	has_many :bids, dependent: :destroy
	has_many :experiences, dependent: :destroy
	has_many :educations, dependent: :destroy
	has_many :certifications, dependent: :destroy
	has_many :awards, dependent: :destroy
	has_many :user_languages, dependent: :destroy

	has_many :user_skills
  	has_many :skills, :through => :user_skills, dependent: :destroy

  	has_many :notifications, :foreign_key =>  :sender_id, class_name:  'Notification', :dependent => :destroy
	

	# Paperclip usage
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/avatar/:style/missing.png",  validate_media_type: false
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


end
