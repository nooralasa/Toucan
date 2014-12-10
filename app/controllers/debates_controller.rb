class DebatesController < ApplicationController
	layout "main"
	
	before_action :confirm_logged_in

	def test parameters
		@accounts = parameters
	end

	def update
		@debate = DebateParticipation.find(params[:id])

	end
	
	

end
