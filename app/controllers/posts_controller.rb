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
    end

    def update
    end

    def destroy
    end

    private
    def post_params
        params.require(:post).permit(:content, :picture)
    end
    
end