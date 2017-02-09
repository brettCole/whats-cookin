class SessionsController < ApplicationController

  def new
  end

  def create
    auth = request.env['omniauth.auth']
    binding.pry
    @user = User.find_or_create_by!(uid: auth['uid']) do |u|
      u.provider = auth['provider']
      #u.uid = auth['uid']
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex
    end
    current_user = @user.id
    #session[:user_id] = @user.id
    redirect_to users_path(@user)
  end

  def destroy
  end

end
