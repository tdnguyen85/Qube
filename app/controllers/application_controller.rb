class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :fb_graph

  private
  
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user

  def fb_graph
		if current_user
			@user = User.find_by_id(session[:user_id])
			token = @user.oauth_token
			@graph = Koala::Facebook::API.new(token)
		end

	end

end
