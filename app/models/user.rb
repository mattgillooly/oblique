class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  has_many :tweets

  def self.from_omniauth(auth)
    user = where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    user.oauth_token = auth["credentials"]["token"]
    user.oauth_secret = auth["credentials"]["secret"]
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

end
