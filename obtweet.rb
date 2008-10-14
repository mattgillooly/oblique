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

Twitter::Client.configure do |conf|
  conf.application_name = 'oblique'
  conf.application_url = 'http://twitter.com/oblique'
  conf.application_version = '0.1'
  conf.source = 'oblique'
end

config_filename = File.join(File.dirname(__FILE__), 'twitter.yml')
twitter = Twitter::Client.from_config(config_filename)

strategies_filename = !ARGV.empty? ? ARGV.last : File.join(File.dirname(__FILE__), 'strategies.yml')
strategies = YAML::load_file(strategies_filename)

status = strategies.random
puts status
message = twitter.status(:post, status)
