class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
        @comment = Comment.new(post_id: params[:post_id])
        # @post = Post.find(params[:post_id])
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = session[:user_id]
        # @post = Post.find(params[:comment][:id])
        if @comment.save
          flash[:notice] = "comment created."
          redirect_to "/posts/#{params[:post_id]}"
        else
          flash[:error] = "Error creating comment."
          redirect_to comments_new_path
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to '/posts'
    end

    def comment_params
        params.require(:comment).permit(:post_id, :user_id, :body)
    end
end
