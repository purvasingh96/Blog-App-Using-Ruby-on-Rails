class CommentsController < ApplicationController
    def new
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new
    end
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        if @comment.save
            redirect_to post_path(@post)
        else
            render :new, status: :unprocessable_entity
        end
    end
    private
        def comment_params
            params.require(:comment).permit(:author, :body, :status)
        end
end
