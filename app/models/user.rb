class User < ApplicationRecord
    has_many :hikes
    has_many :trails, through: :hikes
    has_secure_password
    accepts_nested_attributes_for :hikes



end
