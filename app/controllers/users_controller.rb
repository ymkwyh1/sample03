class UsersController < ApplicationController 

    def show
        @posts = current_user.posts.all
    end

end