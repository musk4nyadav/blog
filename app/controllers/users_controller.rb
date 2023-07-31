class   UsersController < ApplicationController
    def index
        if user_signed_in?
            @user = User.find(current_user.id)
        else
            redirect_to '/404.html'
        end
    end
end