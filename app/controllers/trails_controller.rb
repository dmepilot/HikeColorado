class TrailsController < ApplicationController


    def index
        @trails = Trail.all
    end

    def show
        @trail = Trail.find_by(id: params[:id])
    end
end
