class Hike < ApplicationRecord
   belongs_to :user
   belongs_to :trail 

   # scope :user_with_most_hikes, -> {where(user_id: self.maximum(:user_id).count)}
   # scope :user_with_most_hikes, group(:user_id).select("user_id, count(*) as number_of_hikes")

end
