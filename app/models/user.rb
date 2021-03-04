class User < ApplicationRecord
    has_many :hikes
    has_many :trails, through: :hikes
    has_secure_password

    validates :password, :email, presence: true
    validates :email, uniqueness: true

    # accepts_nested_attributes_for :hikes 



end
