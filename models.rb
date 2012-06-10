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