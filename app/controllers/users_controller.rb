class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
  end

  def show
    @user = User.find(params[:id])
  end

  private
 def user_params
   return params.require(:user).perm it(:name)
 end

end
