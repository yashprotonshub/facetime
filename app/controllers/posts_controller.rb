class PostsController < ApplicationController
    def new
        @post=Post.new
    end

    def index
        @allusers=User.all
        @allrequests= User.find(current_user.id).friend_requests_received.where(status:"pending")
        @allfriends_friendrequest_received = User.find(current_user.id).friend_requests_received.where(status:"approved")
        @allfriends_friendrequest_sent = User.find(current_user.id).friend_requests_sent.where(status:"approved")
        @all_posts= Post.all
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

    def destroy
        @post=Post.find(params[:id])
        @post.destroy
    end

    def edit
        @post=Post.find(params[:id])
    end

    def update
        @post=Post.find(params[:id])
        @post.update(post_params)
        redirect_to user_post_path(current_user.id, @post.id)
    end

    private
        def post_params
            params.require(:post).permit(:title, :body)
        end
end
