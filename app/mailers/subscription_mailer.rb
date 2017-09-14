class SubscriptionMailer < ApplicationMailer
	default from: 'imofy.official@gmail.com'

	def subscription_mail(email)
		@url  = "http://slatejob.com" #ENV['HOST']
		@email = email
		#email_with_name = %("Hello" <"imofy.official@gmail.com">)
		#mail(to: @user.email, subject: 'Welcome to My Awesome Site')
		mail(to: @email, subject: "Abonnement à la newsletter")
	end
end
