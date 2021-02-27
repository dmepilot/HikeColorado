class TrailsController < ApplicationController
    before_action :redirect_if_not_logged_in



    def index
        @trails = Trail.all
    end

    def show
        @trail = Trail.find_by(id: params[:id])
    end
end
