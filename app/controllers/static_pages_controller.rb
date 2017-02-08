class StaticPagesController < ApplicationController
    before_action :root_redirect, only: [:index]
    
    def index
    end

    private
        def root_redirect
            if current_user
                @user = current_user
                redirect_to user_path(@user.id)
            end
        end
end
