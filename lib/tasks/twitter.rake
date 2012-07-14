require 'twitter'

task :post_random_tweets => :environment do
  puts "posting random tweets"
  RandomTweeter.new.post_tweets
end
