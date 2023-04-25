class UsersController < ApplicationController
    def profile_page
        @user_details= User.find(params[:user_id])
    end 
end
