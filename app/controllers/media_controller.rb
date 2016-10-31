class MediaController < ApplicationController
    def index
        @media = Medium.all
    end
    
    def show
        @medium = Medium.find(params[:id])
        @user = @medium.user
    end
    
    def new
        @user = User.find(params[:user_id])
        @medium = @user.media.new
    end
    
    def create
        @user = User.find(params[:user_id])
        @medium = @user.media.new(media_params)
        if @medium.save
            redirect_to(user_path(params[:user_id]), notice: "List item added."
                )
        end
    end
    
    
    def edit
        @medium = Medium.find(params[:id])
    end
    
    
    def update
        @medium = Medium.find(params[:id])
        if @medium.update_attributes(media_params)
            redirect_to user_path(@medium.user_id)
        else
            render 'edit'
        end
    end
    
    def destroy
        @medium = Medium.find(params[:id])
        @medium.destroy
        redirect_to media_path, alert: "List item removed."
    end
    
    private
        def media_params
            params.require(:medium).permit(
                :song, :artist, :album
                )
        end
    
end
