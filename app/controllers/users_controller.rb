class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
    
    def index
        @users = User.all
        if params[:search]
            @users = User.search(params[:search]).order("created_at DESC")
        else
            @users = User.all.order("created_at DESC")
        end
    end

    def following
    #... your logic may look differently here
        @title = "Following"
        @user  = User.find(params[:id])
        @users = @user.following

    end

    def followers
    #... your logic may look differently here
        @title = "Followers"
        @user  = User.find(params[:id])
        @users = @user.followers

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
            flash[:notice] = "You have successfully signed up! You can now add music to your list, and follow other users."  
            redirect_to user_path(@user.id)
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
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :morning_commute, :evening_commute, :profile_photo, :time_zone)
        end
    
        def logged_in_user
          unless current_user
            flash[:danger] = "Please log in."
            redirect_to login_path
          end
        end
    
    
end
