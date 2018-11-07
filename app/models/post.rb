class Post < ApplicationRecord
    belongs_to :user
    has_many :comments

    scope :new_posts, -> { where('DATE(created_at) = ?', Date.today)}
end
