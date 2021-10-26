class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :picture

    validates :picture, presence: true
end
