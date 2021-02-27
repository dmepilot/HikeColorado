class UsersController < ApplicationController
    before_action :redirect_if_not_logged_in, :except=>[:new,:create]


    def new
        @user = User.new
    end

    def create
        # byebug
        @user= User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            # byebug
            redirect_to user_path(@user)
        else
            render :new
        end
    end
    
    
    def show
        # byebug
        @user = User.find_by(id: params[:id])  
    end

    def edit
      @user = User.find_by(id: params[:id])
    end

    def update
        user = User.find_by(id: params[:id])
        user.update(user_params)
        redirect_to user_path(user)
    end


    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :admin)
    end
end
