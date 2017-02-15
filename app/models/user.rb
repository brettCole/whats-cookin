class User < ApplicationRecord
  has_secure_password
  has_many :recipes
  validates :email, :password, presence: true
  validates :email, uniqueness: true

  # def self.sign_in_with_auth(auth)
  #   @user = User.find_by(uid: auth['uid'])
  #   if @user
  #   else
  #     @user = User.create! do |user|
  #       user.provider = auth['provider']
  #       user.uid = auth['uid']
  #       user.name = auth['info']['name']
  #       user.email = auth['info']['email']
  #       user.password = SecureRandom.hex
  #     end
  #   end
  # end
  def self.sign_in_with_auth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth['info']['name']
      user.email = auth['info']['email']
      user.password = SecureRandom.hex
      user.save!
    end
  end

  # def self.sign_in_with_password
  #   user = User.find(email.downcase)
  #   if user == user.authenticae(params[:password]) && user.provider.nil?
  #     @current_user = user.id
  #   end
  # end

end
