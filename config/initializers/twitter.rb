Twitter.configure do |config|
  config.consumer_key = ENV['OBLIQUE_TWITTER_KEY']
  config.consumer_secret = ENV['OBLIQUE_TWITTER_SECRET']
  config.oauth_token = ENV['OBLIQUE_TWITTER_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['OBLIQUE_TWITTER_OAUTH_SECRET']
end
