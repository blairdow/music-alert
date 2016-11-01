class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
    
    def index
        @users = User.all
    end

    def following
    #... your logic may look differently here
        @title = "Following"
        @user  = User.find(params[:id])
        @users = @user.following
#        render 'show_follow'
    end

    def followers
    #... your logic may look differently here
        @title = "Followers"
        @user  = User.find(params[:id])
        @users = @user.followers
#        render 'show_follow'
    end
    
    def show
        @user = User.find(params[:id])
        @media = @user.media
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "You have successfully signed up!"
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to user_path(@user.id)
        else
            render 'edit'
        end
    end
    
    def password_form
        @user = current_user
    end
    
    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :morning_commute, :evening_commute)
        end
    
        def logged_in_user
          unless current_user
            flash[:danger] = "Please log in."
            redirect_to login_path
          end
        end
    
    
end
