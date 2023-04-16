class CommentsController < ApplicationController

    def destroy
        @comment=current_user.comments.find(params[:id])
        @comment.destroy
    
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

