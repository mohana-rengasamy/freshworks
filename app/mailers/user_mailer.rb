class UserMailer < ApplicationMailer
    def welcome_email(user_id)
        @current_user=User.find(user_id)
        @user = User.find(user_id)
    
        mail(   :to      => @user.email,
                :subject => "Welcome"
        ) do |format|
          format.html
        end
      end
end
