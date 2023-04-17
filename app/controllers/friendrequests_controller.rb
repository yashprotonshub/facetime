class FriendrequestsController < ApplicationController
    def create
        @friend=Friendrequest.create(status:"pending", sender_id:params[:user_id], receiver_id:params[:receiver_id]) 
    end

    
    def update
        @friend=Friendrequest.find(params[:friendrequest_id])
        @friend.update(status:"approved")
    end
    def destroy
        @friend=Friendrequest.find(params[:id])
        @friend.destroy
        redirect_to root_path
    end
end



