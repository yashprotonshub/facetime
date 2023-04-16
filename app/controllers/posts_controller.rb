class PostsController < ApplicationController
    def new
        @post=Post.new
    end

    def create
        @post= current_user.posts.create(post_params)
        redirect_to root_path
    end
    
    def show
        @post=Post.find(params[:id])
        @comment=Comment.new
        @all_comments=Post.find(@post.id).comments
    end


    private
        def post_params
            params.require(:post).permit(:title)
        end
end
