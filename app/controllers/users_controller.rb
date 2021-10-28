class UsersController < ApplicationController 

    before_action :authenticate_user!, only: [:show]

    def show
        @posts = current_user.posts.all
        @profile = current_user.profile
    end

end