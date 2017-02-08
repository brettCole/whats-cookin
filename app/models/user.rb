class User < ApplicationRecord
  has_secure_password
  has_many :recipes
  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true

  def self.from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash[ 'uid'])
    user.username = auth_hash['info']['username']
    user.save!
    user
  end

end
