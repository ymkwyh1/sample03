class CommentsController < ApplicationController
    
    def index
        @post = Post.find_by(id: params[:post_id])
        @comments = @post.comments.all
    end

    def new
        @comment = current_user.comments.build
    end

    def create 
        @post = Post.find_by(id: params[:post_id])
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

end