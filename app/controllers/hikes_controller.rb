class HikesController < ApplicationController
     before_action :redirect_if_not_logged_in 

    def new
        @hike = Hike.new
    end

    def create
        @hike = Hike.new(hike_params)
        if @hike.save
            redirect_to user_hike_path(current_user, @hike)
        else
            render :new
        end
    end

    def index
        if params[:user_id]
            @hikes = User.find_by_id(params[:user_id]).hikes.order(date: :desc)
        elsif params[:trail_id]
            @hikes = Trail.find_by_id(params[:trail_id]).hikes.order(date: :desc)  
        else
            @hikes = Hike.order(date: :desc)
        end
    end

    def show
        @hike = Hike.find(params[:id])
    end

    def edit
        @hike = Hike.find_by(id: params[:id])
        redirect_to user_path(current_user) if @hike.user.id != current_user.id
    end

    def update
        hike = Hike.find_by(id: params[:id])
        hike.update(hike_params)
        redirect_to hike_path(hike)
    end

    private
    def hike_params
        params.require(:hike).permit(:date, :rating, :comments, :trail_id, :user_id)
    end
end
