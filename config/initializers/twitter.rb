Twitter.configure do |config|
  config.consumer_key = TWITTER_CONFIG["notifier_key"]
  config.consumer_secret = TWITTER_CONFIG["notifier_secret"]
  config.oauth_token = TWITTER_CONFIG["token"]
  config.oauth_token_secret = TWITTER_CONFIG["token_secret"]
end