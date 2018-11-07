class User < ApplicationRecord
    has_many :stats
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy

    has_secure_password
    validates :email, presence: true, uniqueness: true
end
