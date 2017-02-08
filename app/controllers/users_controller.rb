class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save if valid?
    redirect_to user_path(@user)
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
