class UsersController < ApplicationController

    def new
    end

    def create
    end
    
    
    def show
        # byebug
        @user = User.find_by(id: params[:id])  
    end


    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :admin)
    end
end
