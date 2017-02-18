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
      @user = User.sign_in_with_auth(auth)
      session[:id] = @user.id
    else
      # @user = User.sign_in_with_password
      # session[:id] = @user.id
      # binding.pry
      @user = User.find_by(email: params[:email])
      if @user == @user.authenticate(params[:password]) && @user.provider.nil?
        session[:id] = @user.id
      end
    end
    redirect_to user_path(@user)
  end

  def destroy
    session.delete(:id)
    redirect_to '/'
  end

end

# user = User.find_by(name: params[:user][:name])
#     user = user.try(:authenticate, params[:user][:password])
#     return redirect_to(controller: 'sessions', action: 'new') unless user
#     session[:user_id] = user.id
#     @user = user
#     redirect_to controller: 'welcome', action: 'home'
