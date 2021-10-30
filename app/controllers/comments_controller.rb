class CommentsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]
    before_action :set_post, only: [:index, :create]

    
    def index
        @comments = @post.comments.all
    end

    def new
        @comment = current_user.comments.build
    end

    def create 
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to post_comments_path(post_id: @post.id), notice: 'Saved!'
        else
            flash.now[:error] = 'Failed to save!'
            render :new
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end

    def set_post
        @post = Post.find_by(id: params[:post_id])
    end

end