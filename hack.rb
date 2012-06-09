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

get '/hnews' do
  content_type 'application/json'
  HackerNews.all.to_json
end

get '/proggit' do
  content_type 'application/json'
  Proggit.all.to_json
end

get '/reddit' do
  content_type 'application/json'
  Reddit.all.to_json
end