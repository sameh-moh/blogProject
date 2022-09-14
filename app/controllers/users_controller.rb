class UsersController < ApplicationController
    before_action :authenticate_user!, only: :index

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end
