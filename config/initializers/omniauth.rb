OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER_CONFIG["key"], TWITTER_CONFIG["secret"]
end