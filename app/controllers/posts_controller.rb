class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.create(post_params)
        @post.user_id = session[:user_id]
        if @post.save(post_params)
            flash[:notice] = "Post created!"
            redirect_to '/posts'
        else
            flash[:error] = "Post not created!"
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        post = Post.find(params[:id])
        post.update(post_params)
        flash[:notice] = "Post Updated!"
        redirect_to '/posts'
    end

    def destroy
        post = Post.find(params[:id]).destroy
        flash[:notice] = "Post deleted."
        redirect_to posts_path 
    end

    def validate
        if session[:user_id] != @post.user_id
            flash[:notice] = "You can't edit this post"
            redirect_to posts_path
        end
    end
    
    def post_params
        params.require(:post).permit(:entry, :user_id)
    end
end