class UsersController < ApplicationController
#    before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
#    
#    def following
#    #... your logic may look differently here
#        @title = "Following"
#        @user  = User.find(params[:id])
#        @users = @user.following.paginate(page: params[:page])
#        render 'show_follow'
#    end
#
#    def followers
#    #... your logic may look differently here
#        @title = "Followers"
#        @user  = User.find(params[:id])
#        @users = @user.followers.paginate(page: params[:page])
#        render 'show_follow'
#    end
    
    def index
        @users = User.all
    end
    
    def following
    end
    
    def followers
    end
    
end
