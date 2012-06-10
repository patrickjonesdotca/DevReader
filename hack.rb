require 'scrapify'
require 'sinatra'
require './models'

get '/' do
  {
    source: 'error',
	results: [{text: 'This is not the route you want', href: nil}]
  }.to_json
end

get '/hacker_news' do
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