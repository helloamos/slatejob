class MessageMailer < ApplicationMailer
  helper :application
  #default template_path: 'messages/message_mailer'
  layout 'mailer'
  add_template_helper EmailHelper
  add_template_helper ApplicationHelper
	default from: 'SlateJob <support@slatejob.com>'
 
  def message_email(sender, recipient,  message)
    @recipient = User.find(recipient)
    @sender = User.find(sender)
    @message = Message.find(message)
    
    @url  = "http://slatejob.com"
    #email_with_name = %("Hello" <"imofy.official@gmail.com">)
    #mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    mail(to: @recipient.email, subject: "Message de contact")
  end
end
