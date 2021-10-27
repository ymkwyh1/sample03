class TimelinesController < ApplicationController
    
    def show
        @user = User.find_by(id: params[:user_id])
        @posts = @user.posts.all
    end

end