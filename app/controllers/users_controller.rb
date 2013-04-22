class UsersController < ApplicationController
	
	before_filter :fb_graph, :show_bday, :birthday_match, :current_date
	
	def welcome

	end

	def fb_graph
		if current_user
			@user = User.find_by_id(session[:user_id])
			token = @user.oauth_token
			@graph = Koala::Facebook::API.new(token)
		end
	end

	def mainpage
		set_match
		profile_info
		
		#render :json => @likes_list
	end

	

	def birthday_match
		if current_user
			set_match
			profile_info

		end
	end

	def show_bday
    set_match
   	profile_info

    if @match 
			@friend_has_bday = true
			@message ="#{@match.size} of your friends' birthday is today.  Would you like to send them a Qube?"
			counter = 0
			@profile_bday = @graph.get_object(@match[counter])
			@picture_bday = @graph.get_picture(@match[counter])
		end
	end

	def post_to_fb_wall
		@fb_uid = params[:fbid]
		@fb_id_final = @fb_uid[0]
		set_match
		@graph.put_connections("me", "feed", :message => params[:link])
		redirect_to mainpage_path
	end


	def send_email
	  AppEmail.form_email(params[:to], params[:subject], params[:body]).deliver
	end
end
