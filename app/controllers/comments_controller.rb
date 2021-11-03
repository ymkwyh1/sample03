class CommentsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]
    before_action :set_post, only: [:index, :create]


    def index
        @comments = @post.comments.all
    end

    def create 
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id
        @comment.save!

        render json: @comment
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end

    def set_post
        @post = Post.find_by(id: params[:post_id])
    end

end