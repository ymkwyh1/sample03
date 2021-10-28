class UsersController < ApplicationController 

    def show
        @posts = current_user.posts.all
        @profile = current_user.profile
    end

end