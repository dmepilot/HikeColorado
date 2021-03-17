class UsersController < ApplicationController
     before_action :redirect_if_not_logged_in, :except=>[:new,:create]
     before_action :redirect_if_not_authorized, :only=>[:show, :edit]
     before_action :set_user, :except=>[:new, :create]


    def new
        @user = User.new
    end

    def create
         @user= User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end
    
    
    def show
    end

    def edit
    end

    def update
        if @user.update(user_params)
          redirect_to user_path(@user)
        else
            render :edit
        end
    end


    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :admin, :email)
    end

    def admin?
        current_user.admin
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end
end
