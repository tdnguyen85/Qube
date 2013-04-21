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
		@user_profile = @graph.get_object('me')
		@picture = @graph.get_picture(@user_profile['id'])
	end

	def mainpage
		
		
		#render :json => @likes_list
		
		#@picture_bday = @graph.get_picture(@match[0])

	end

	def current_date
		@current_date = Time.now.strftime("%m/%d/%Y").split("/")[0..1].join
	end

	def birthday_match
		if current_user
			@friends = @graph.get_connections("me", "friends?fields=id,name,birthday,picture.type(large)")
			@match = []
			@friends.each do |item|
				if item['birthday'].to_s.split('/')[0..1].join == '0620'
					@match << item['id']
				end
			end
		end
	end

	

	def show_bday
		# if @match
		# 	if @match.size > 0
		# 	@friend_has_bday = true
		# 	end
		# end
		
		if @match
			@friend_has_bday = true
			@message ="#{@match.size} of your friends' birthday is today.  Would you like to send them a Qube?"
			counter = 0
				@profile_bday = @graph.get_object(@match[counter])
				@picture_bday = @graph.get_picture(@match[counter])

				#counter += 1
		end
	end

	def get_profile(id)
		@profile_bday = @graph.get_object(@match[counter])

	end

	def get_picture(id)
		@picture_bday = @graph.get_picture(@match[counter])

	end


	def post_to_fb_wall
		if @match
			@graph.put_connections(params[:fbid], "feed", :message => params[:link])
			redirect_to mainpage_path
		else
			return "Unable to post to your friend's facebook wall"
		end
	end

	def send_email
	  AppEmail.form_email(params[:to], params[:subject], params[:body]).deliver
	end
end
