class ApplicationMailer < ActionMailer::Base
	helper :application
	add_template_helper EmailHelper
	add_template_helper ApplicationHelper
	default from: 'SlateJob <support@slatejob.com>'
	layout 'mailer'
end
