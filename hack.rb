require 'scrapify'
require 'sinatra'

class HackerNews
  include Scrapify::Base
  html "http://news.ycombinator.com/"

  attribute :text, xpath: "//td[@class='title']/a"
  attribute :href, xpath: "//td[@class='title']/a/@href"

  key :text
end

class Proggit
  include Scrapify::Base
  html "http://www.reddit.com/r/programming"
  
  attribute :text, xpath: "//p[@class='title']/a[@class='title ']"
  attribute :href, xpath: "//p[@class='title']/a[@class='title ']/@href"
  
  key :text
end

class Reddit
  include Scrapify::Base
  html "http://www.reddit.com"
  
  attribute :text, xpath: "//p[@class='title']/a[@class='title ']"
  attribute :href, xpath: "//p[@class='title']/a[@class='title ']/@href"
  
  key :text
end


get '/' do
  {
    source: 'error',
	results: ['This is not the route you want']
  }.to_json
end

get '/hnews' do
  begin
    query_results = HackerNews.all
	rescue Exception => msg
	  query_results = [ msg ]
  end
  content_type 'application/json'
  {
    source: 'hacker_news',
	results: query_results
  }.to_json
end

get '/proggit' do
  begin
    query_results = Proggit.all
	rescue Exception => msg
	  query_results = [ msg ]
  end
  content_type 'application/json'
  {
    source: 'proggit',
	results: query_results
  }.to_json
end

get '/reddit' do
  begin
    query_results = Reddit.all
	rescue Exception => msg
	  query_results = [ msg ]
  end
  content_type 'application/json'
  {
    source: 'reddit',
	results: query_results
  }.to_json
end