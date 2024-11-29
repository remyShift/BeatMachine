class UsersController < ApplicationController
  def show
    @likes = current_user.likes
  end

  def index
    @users = User.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
