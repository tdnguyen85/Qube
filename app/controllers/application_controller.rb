class ApplicationController < ActionController::Base
  protect_from_forgery


  private
  
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user

  def set_match
  	current_date 
  	if current_user && @graph
	    @friends = @graph.get_connections("me", "friends?fields=id,name,birthday,picture.type(large)")
			@match = []
			@friends.each do |item|
				if item['birthday'].to_s.split('/')[0..1].join == '0620'
					@match << item['id']
				end
			end
		end
  end

  def profile_info
  	if @graph
			@user_profile = @graph.get_object('me')
			@picture = @graph.get_picture(@user_profile['id'])
		end
	end
	
  def current_date
		@current_date = Time.now.strftime("%m/%d/%Y").split("/")[0..1].join
	end


end
