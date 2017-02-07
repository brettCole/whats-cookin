Rails.application.config.middleware.use OmniAuth::Builder do
  #Twitter
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  #Google+
  provider :gplus, ENV['GPLUS_KEY'], ENV['GPLUS_SECRET']
  #Facebook
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
