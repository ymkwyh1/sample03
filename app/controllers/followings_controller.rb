class FollowingsController < ApplicationController 

    def show
        @user = User.find_by(id: params[:user_id])
        @followings = @user.followings
    end

end 