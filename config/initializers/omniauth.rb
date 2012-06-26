OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :runkeeper, RUNKEEPER_CONFIG['client_id'], RUNKEEPER_CONFIG['client_secret']
end
