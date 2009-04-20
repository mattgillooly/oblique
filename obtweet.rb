#!/opt/local/bin/ruby

require 'rubygems'
require 'yaml'
gem 'twitter4r'
require 'twitter'
require 'twitter/core'
require 'twitter/console'
require 'twitter/config'
require 'time'

BOT_NAME = ARGV.last || 'oblique'

class Array
  def random
    self[(rand * length).to_i]
  end
end

class File
  def self.in_this_dir(fname)
    File.join(File.dirname(__FILE__), fname)
  end
end

Twitter::Client.configure do |conf|
  conf.application_name = 'oblique'
  conf.application_url = 'http://twitter.com/oblique'
  conf.application_version = '0.1'
  conf.source = 'oblique'
end

case BOT_NAME
when 'oblique':
  config_filename = File.in_this_dir('twitter.yml')
  twitter = Twitter::Client.from_config(config_filename)

  strategies_filename = File.in_this_dir('strategies.yml')
  strategies = YAML::load_file(strategies_filename)
  status = strategies.random
when 'twandal'
  config_filename = File.in_this_dir('twandal.yml')
  twitter = Twitter::Client.from_config(config_filename)

  require 'twandal.rb'
  status = Twandal.generate_status
end
  
puts status
message = twitter.status(:post, status)
