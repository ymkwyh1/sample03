class PostsController < ApplicationController 

    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_post, only: [:edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def new
        @post = current_user.posts.build
    end

    def create 
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to root_path, notice: 'Saved!'
        else
            flash.now[:error] = 'Failed to save!'
            render :new
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        comments = @post.comments

        render json: comments
    end

    def update
        if @post.update(post_params)
            redirect_to posts_path, notice: 'Updated!'
        else
            flash.now[:error] = 'failed to update!'
            render :edit
        end
    end

    def destroy
        if @post.destroy!
        redirect_to posts_path, notice: 'Deleted!'
        end
    end

    private
    
    def post_params
        params.require(:post).permit(:content, :picture)
    end

    def set_post
        @post = current_user.posts.find_by(id: params[:id])
    end

end
