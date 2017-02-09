class SessionsController < ApplicationController

  def new
  end

  # def create
  #   auth = request.env['omniauth.auth']
  #     binding.pry
  #   @user = User.find_or_create_by!(uid: auth['uid']) do |u|
  #     u.provider = auth['provider']
  #     #u.uid = auth['uid']
  #     u.name = auth['info']['name']
  #     u.email = auth['info']['email']
  #     u.password = SecureRandom.hex
  #   end
  #   current_user = @user.id
  #   redirect_to users_path(@user)
  # end
  def create
    auth = request.env["omniauth.auth"]
    if auth
      sign_in_with_auth(auth)
    else
      sign_in_with_password
    end
    redirect_to '/recipes/index'
  end

  def destroy
  end

end

# user = User.find_by(name: params[:user][:name])
#     user = user.try(:authenticate, params[:user][:password])
#     return redirect_to(controller: 'sessions', action: 'new') unless user
#     session[:user_id] = user.id
#     @user = user
#     redirect_to controller: 'welcome', action: 'home'
