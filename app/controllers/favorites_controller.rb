class FavoritesController < ApplicationController 

    before_action :authenticate_user!

    def show
        @posts = current_user.favorite_posts
    end
  
end