class FollowersController < ApplicationController 

    def show
        @user = User.find_by(id: params[:user_id])
        @followers = @user.followers
    end

end 