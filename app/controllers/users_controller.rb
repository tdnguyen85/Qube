class UsersController < ApplicationController
	
	before_filter :profile
	
	def welcome

	end

	def fb_graph
		
	end

	def profile
		@user = User.find_by_id(session[:user_id])
		token = @user.oauth_token
		@graph = Koala::Facebook::API.new(token)
		@user_profile = @graph.get_object('me')
		@picture = @graph.get_picture(@user_profile['id'])
	end

	

end
