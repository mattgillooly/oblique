require 'twitter'

task :post_random_tweets => :environment do
  RandomTweeter.new.post_tweets
end
