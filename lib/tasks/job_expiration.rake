namespace :job_expiration do
	desc "TODO"
	task update_status: :environment do
		current_date = DateTime.now
		status = 'open'
		projects = Project.check_expiration_date(current_date, status)
		projects.update_all(status: 'closed')
		puts "=====( Status was updated succefull! )====="
	end

end
