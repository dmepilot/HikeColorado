class Trail < ApplicationRecord
    has_many :hikes
    has_many :users, through: :hikes
    accepts_nested_attributes_for :hikes
end
