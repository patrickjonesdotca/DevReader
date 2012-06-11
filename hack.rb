require 'scrapify'
require 'sinatra'
require './models'


get '/' do
  {
    source: 'self',
	results: [ {text: "Hacker News", href: "/hacker_news"}, {text: "Reddit/Programming", href: "/proggit"},
	{ text: "Reddit", href: "/reddit" }, { text: "Slashdot", href: "/slashdot"},
	{ text: "BGR", href: "/bgr" }, { text: "Lillyputting", href: "/lillyputting"}, { text: "Wired", href: "/wired" },
	{ text: "Singularity Hub", href: "/singularity_hub"}
	]
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


get '/slashdot' do
   begin
    query_results = Slashdot.all
	query_results.each { |t| begin t.href.gsub!("\/\/", "http://") rescue '' end }
	rescue Exception => msg
	  query_results = [ msg ]
  end
  content_type 'application/json'
  {
    source: 'slashdot',
	results: query_results
  }.to_json 
end

get '/bgr' do
   begin
    query_results = BGR.all
	rescue Exception => msg
	  query_results = [ msg ]
  end
  content_type 'application/json'
  {
    source: 'bgr',
	results: query_results
  }.to_json 
end

get '/lillyputting' do
   begin
    query_results = Lilyputting.all
	rescue Exception => msg
	  query_results = [ msg ]
  end
  content_type 'application/json'
  {
    source: 'lillyputting',
	results: query_results
  }.to_json 
end

get '/wired' do
   begin
    query_results = Wired.all
	rescue Exception => msg
	  query_results = [ msg ]
  end
  content_type 'application/json'
  {
    source: 'wired',
	results: query_results
  }.to_json 
end

get '/singularity_hub' do
   begin
    query_results = SingularityHub.all
	rescue Exception => msg
	  query_results = [ msg ]
  end
  content_type 'application/json'
  {
    source: 'singularity_hub',
	results: query_results
  }.to_json 
end



