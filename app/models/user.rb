class User < ApplicationRecord
    has_many :stats

    has_secure_password
    validates :email, presence: true, uniqueness: true
end
