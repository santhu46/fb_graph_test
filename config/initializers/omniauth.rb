Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['157744727745380'], ENV['4c668ccb97199f9d741ed5f746780d53']
end
