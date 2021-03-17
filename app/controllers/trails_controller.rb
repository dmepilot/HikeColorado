class TrailsController < ApplicationController
     before_action :redirect_if_not_logged_in
     before_action :set_trail, :only=>[:show, :update]


    def index
        @trails = Trail.all
        # @trails = Trail.searched_trails(params[:query]) unless params[:query].blank?
        @most_hiked = Trail.most_hiked_trail
        @most_user_hikes = User.user_with_most_hikes
        @highest_rated = Trail.highest_rated_trail
    end

    def show
        #  @trail = Trail.find_by(id: params[:id])
    end

    def new
        if current_user.admin?
            @trail = Trail.new
        else
            redirect_to user_path(current_user)
        end
    end

    def create
        @trail = Trail.create(trail_params)
        redirect_to trail_path(@trail)
    end

    def edit
        if current_user.admin?
            # @trail = Trail.find_by(id: params[:id])
            set_trail
        else
            redirect_to user_path(current_user)
        end
    end

    def update
        # @trail = Trail.find_by(id: params[:id])
        @trail.update(trail_params)
        redirect_to trail_path(@trail)
    end

    def trails_search
        @trails = Trail.searched_trails(params[:query]) 
    end

    private
    def trail_params
        params.require(:trail).permit(:name, :length, :difficulty, :dogs, :notes, :query)
    end

    def set_trail
        @trail = Trail.find_by(id: params[:id])
    end
end
