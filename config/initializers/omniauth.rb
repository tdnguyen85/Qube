Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :facebook, '549211788435364', 'b01c254636eb293363187ded7f57a98c', :scope => 'read_stream, publish_actions, publish_stream, friends_photos, user_photos, publish_stream, user_status, friends_status, user_checkins, friends_checkins, user_birthday, friends_birthday'
end
