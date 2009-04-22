require 'open-uri'
require 'json'
require 'cgi'

class Array
  def random
    self[Kernel.rand(length)]
  end
end


module Twandal
  def self.twitter_trends
    d = open('http://search.twitter.com/trends/current.json')
    doc = JSON.parse(d.read)
    doc["trends"].values.first.map{|h| h["name"]}
  end

  def self.tweet_search(q)
    doc = JSON.parse(open("http://search.twitter.com/search.json?q=#{CGI.escape(q)}").read)
    doc["results"].map{|h| h["text"]}
  end

  def self.search_and_replace(t1, t2)
    puts "replacing #{t1} with #{t2}"
    a = self.tweet_search(t1)
    a.map{|ss| ss.gsub(/#{t1}/i, t2)}
  end

  def self.generate_status
    trends = twitter_trends
    a = trends.random
    trends.delete(a)
    b = trends.random
    search_and_replace(a, b).reject{|s| s.length < 40}.random
  end
end
