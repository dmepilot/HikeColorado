module HikesHelper

    def index_display
        if params[:user_id]
            user=User.find(params[:user_id])
           "#{user.name}'s Hikes"
        elsif params[:trail_id]
            trail=Trail.find(params[:trail_id])
            "#{trail.name} Hikes"
        else
            "All Hikes"
        end
    end
end
