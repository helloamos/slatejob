class HomeController < ApplicationController

	def index
	end

	def landing
		@subscription = Subscription.new
	end
end