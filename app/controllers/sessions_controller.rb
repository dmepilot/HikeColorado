class SessionsController < ApplicationController

    def create
        if auth
          user =User.find_or_create_by(email: auth['info']['email']) do |u|
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(12)
          end
            session[:user_id] = user.id
            redirect_to "/users/#{user.id}"
        else
          user = User.find_by(email: params[:user][:email])
            if user && user.authenticate(params[:user][:password])
              session[:user_id] = user.id
              redirect_to "/users/#{user.id}"
            else
              flash[:message] = "Incorrect login info, please try again"
              redirect_to "/login"
            end
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end

    private
    def auth
        request.env['omniauth.auth']
    end

end


