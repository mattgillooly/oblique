#!/opt/local/bin/ruby

require 'base64'
require 'net/http'
require 'rubygems'
require 'yaml'

class Array
  def random
    self[(rand * length).to_i]
  end
end


strategies_filename = 'strategies.yml'
strategies_filename = ARGV.last unless ARGV.empty?

strategies = YAML::load(open(strategies_filename))
status = strategies.random
puts status

email = 'email@domain.com'
pass = 'MY_EXTREMELY_SECRET_PASSWORD'
auth = Base64.encode64(email + ':' + pass)

h = Net::HTTP.new('twitter.com', 80)

resp, data = h.post('/statuses/update.json',
                    "status=" + status,
                    { 'Authorization' => 'Basic ' + auth })

