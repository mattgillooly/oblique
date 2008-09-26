#!/opt/local/bin/ruby

require 'rubygems'
require 'yaml'
require 'twitter'
require 'twitter/console'
require 'time'

class Array
  def random
    self[(rand * length).to_i]
  end
end

config_filename = 'twitter.yml'
twitter = Twitter::Client.from_config(config_filename)

strategies_filename = 'strategies.yml'
strategies_filename = ARGV.last unless ARGV.empty?

strategies = YAML::load(open(strategies_filename))
status = strategies.random
puts status

message = twitter.status(:post, status)

