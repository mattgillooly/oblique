class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  has_many :quips

  scope :hourly_tweeters, where(tweet_hourly: true)

  def self.from_omniauth(auth)
    user = where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)

    if creds = auth["credentials"]
      user.oauth_token = creds["token"]
      user.oauth_secret = creds["secret"]
    end

    user.save!
    user
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
    end
  end

  def twitter
    if provider == "twitter"
      @twitter ||= Twitter::Client.new(
                     consumer_key: ENV['OBLIQUE_TWITTER_KEY'],
                     consumer_secret: ENV['OBLIQUE_TWITTER_SECRET'],
                     oauth_token: oauth_token,
                     oauth_token_secret: oauth_secret
                   )
    end
  end

  # below pattern from https://github.com/rails/rails/commit/14fc8b34521f8354a17e50cd11fa3f809e423592
  def settings
    @settings ||= Settings.new(tweet_hourly)
  end

  def settings=(settings)
    self[:tweet_hourly] = settings.tweet_hourly
    @settings = settings
  end

end
