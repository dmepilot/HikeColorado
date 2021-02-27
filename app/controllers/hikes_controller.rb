class HikesController < ApplicationController
    before_action :redirect_if_not_logged_in


    def new
        @hike = Hike.new
    end

    def create
        # byebug
        @hike = Hike.create(hike_params)
        if @hike.save
            redirect_to hike_path(@hike)
        else
            redirect_to new_hike_path
        end
    end

    def index
        # byebug
        if params[:user_id]
            @hikes = User.find_by_id(params[:user_id]).hikes
        elsif params[:trail_id]
            @hikes = Trail.find_by_id(params[:trail_id]).hikes  
        else
            @posts = Post.all
        end
    end

    def show
        # byebug
    
        @hike = Hike.find(params[:id])
    end

    def edit
        
    end

    def update
    end

    private
    def hike_params
        params.require(:hike).permit(:date, :rating, :comments, :trail_id, :user_id)
    end
end
