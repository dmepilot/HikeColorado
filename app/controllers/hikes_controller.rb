class HikesController < ApplicationController
     before_action :redirect_if_not_logged_in 
     before_action :set_hike, :only=>[:show, :edit, :update]


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
    end

    def edit
        redirect_to user_path(current_user) if @hike.user.id != current_user.id
    end

    def update
        if @hike.update(hike_params)
          redirect_to hike_path(hike)
        else
            render :edit
        end
    end

    private
    def hike_params
        params.require(:hike).permit(:date, :rating, :comments, :trail_id, :user_id)
    end

    def set_hike
        @hike = Hike.find(params[:id])    
    end
end
