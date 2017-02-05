Rails.application.config.middleware.use OmniAuth::Builder do
  #Twitter
  provider :twitter, "6kUs79OHOgHAz1m4e7WXU7g4x", "ivy9x3tx9oPz2VFDlRICZchtQOQmVQ2jn0vCCHRlyuXP0nbzBt"
  #Google+
  provider :gplus, "241440708068-61s48orb36jc1sm4kc9hgvhm80uvoeg7.apps.googleusercontent.com", "9a5Q5o4cOZ0XuSkOJFMy7Ni_"
  #Facebook
  provider :facebook, "1583990538282122", "5fbf7f22b85bb660346e44aa3fa75431"
end
