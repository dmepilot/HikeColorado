class Trail < ApplicationRecord
    has_many :hikes
    has_many :users, through: :hikes
    # accepts_nested_attributes_for :hikes

     scope :most_hiked_trail, -> {joins(:hikes).group('trails.id').order('count(trails.id) desc')}


    def total_rating
        @rating = 0
        self.hikes.each do |h|
          @rating = @rating + h.rating 
        end
        total_rating = @rating.to_f / self.hikes.all.count 
        total_rating.round(2)
    end

    def self.highest_rated_trail
        highest = Trail.all.map {|trail| trail.total_rating}.max
        Trail.all.select {|trail| trail.total_rating == highest }
    end
end
