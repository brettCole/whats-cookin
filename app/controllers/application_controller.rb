class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def logged_in?
    !!current_user
  end

  # def sign_in_with_auth(auth)
  #   user = User.find_by(uid: auth['uid'])
  #   if user
  #     @current_user = user.id
  #   else
  #     user = User.create! do |user|
  #       u.provider = auth['provider']
  #       u.uid = auth['uid']
  #       u.name = auth['info']['name']
  #       u.email = auth['info']['email']
  #       u.password = SecureRandom.hex
  #
  #       @current_user = user.id
  #     end
  #   end
  # end
  #
  # def sign_in_with_password
  #   user = User.find_by(email: params[:email].downcase)
  #   if user == user.authenticae(params[:password]) && user.provider.nil?
  #     @current_user = user.id
  #   end
  # end

end
