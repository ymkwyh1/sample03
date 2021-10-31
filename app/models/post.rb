class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_one_attached :picture

    validates :picture, presence: true

    def display_created_at
        I18n.l(self.created_at, format: :default)
    end
    
end
