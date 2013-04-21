class AppEmail < ActionMailer::Base
  
	default :from => "tdnguyen85@gmail.com"
     def form_email(to, subject, body)
          @body = body
          mail(:to => to, :subject => subject)
     end
end
