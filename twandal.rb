require 'open-uri'
require 'json'
require 'cgi'

  
class Array
  def random
    self[Kernel.rand(length)]
  end

  def search_and_replace(t1, t2)
    puts "replacing #{t1} with #{t2}"
    self.map{|ss| ss.gsub(/#{t1}/i, t2)}
  end

  def filter_length(min_length = 40)
    self.reject{|s| s.length < min_length}
  end

  def filter_terms(terms)
    self.reject{|s| terms.detect{|t| s.match(/#{t}/i) }}
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

    a.map{|ss| ss.gsub(/#{t1}/i, t2)}
  end

  def self.generate_status
    trends = twitter_trends
    a = trends.delete(trends.random)
    b = trends.delete(trends.random)
    tweet_search(a).filter_length.filter_terms(trends).search_and_replace(a,b).random
  end
end
