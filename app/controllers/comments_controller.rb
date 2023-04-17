class CommentsController < ApplicationController

    def destroy
        @comment=current_user.comments.find(params[:id])
        @comment.destroy
        
    end

    def edit
        @post=Post.find(params[:post_id])
        @comment=Comment.find(params[:id])
        @user=User.find(params[:user_id])
    end

    def update
        @comment=Comment.find(params[:id])
        @comment.update(comment_params)
        redirect_to user_post_path(params[:user_id], params[:post_id])
    end
    

    def create
        @post=Post.find(params[:post_id])
        @comment=Post.find(params[:post_id]).comments.create(comment_params.merge(user_id: current_user.id))
    end

    private
        def comment_params
            params.require(:comment).permit(:body)
        end
end

