class HikesController < ApplicationController

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

    def show
        @hike = Hike.find_by(id: params[:id])
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
