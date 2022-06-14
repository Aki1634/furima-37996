class UsersController < ApplicationController
  def show
    @users = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
  end
end
