OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['OBLIQUE_TWITTER_KEY'], ENV['OBLIQUE_TWITTER_SECRET']
end
