class PostsController < ApplicationController 

    def index
        @posts = Post.all
    end

    def show
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

    def edit
        @post = current_user.posts.find_by(id: params[:id])
    end

    def update
        @post = current_user.posts.find_by(id: params[:id])
        if @post.update(post_params)
            redirect_to posts_path, notice: 'Updated!'
        else
            flash.now[:error] = 'failed to update!'
            render :edit
        end
    end

    def destroy
        @post = current_user.posts.find_by(id: params[:id])
        if @post.destroy!
        redirect_to posts_path, notice: 'Deleted!'
        end
    end

    private
    def post_params
        params.require(:post).permit(:content, :picture)
    end

end
