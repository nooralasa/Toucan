class TopicsController < ApplicationController

	layout "main"
	before_action :confirm_logged_in, :only => [:debate_temp]
	def index
		
	end
	

	def update

	end 

	def new

	end
	
	def create
		
		@topic = Topic.new(topic_params)
		@topic.debates.build
		
  		if @topic.save
  			
  			
  			
  			redirect_to(:action => 'index')
  		else 
  			flash[:notice] = "Couldn't create debate, Please try again"
  			redirect_to(:controller => 'debates', :action => 'index', :params => params[:debate])


  		end
	end

	def test
		@debates_for_display = Topic.newest_first 
	end
	
	def debate_temp
					
	end

	def destroy

	end 


	private
		def topic_params

			params[:topic][:account_id] = session[:user_id].to_i
			params.require(:topic).permit(:account_id, :topic_sentence, :description, :left_side_topic, :right_side_topic,:category, :tags, :debates)
		end
	
end
