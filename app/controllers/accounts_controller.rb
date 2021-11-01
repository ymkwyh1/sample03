class AccountsController < ApplicationController 

    def show
        @user = User.find(params[:id])

        if @user.id == current_user&.id
            @posts = current_user.posts.all
            @profile = current_user.profile
            render 'users/show'
        end

    end
    
end