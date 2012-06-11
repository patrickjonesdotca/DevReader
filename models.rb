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

class DZone
  include Scrapify::Base
  html "http://www.dzone.com/links/index.html"
  
  attribute :text, xpath: "//h3/a"
  attribute :href, xpath: "//h3/a/@href"
  
  key :text
end

class Slashdot
  include Scrapify::Base
  html "http://www.slashdot.org"
  
  attribute :text, xpath: "//h2[@class='story']/span/a"
  attribute :href, xpath: "//h2[@class='story']/span/a/@href"
  
  key :text
end

class BGR
  include Scrapify::Base
  html "http://bgr.com"
  
  attribute :text, xpath: "//div[@class='post']/h2/a"
  attribute :href, xpath: "//div[@class='post']/h2/a/@href"
  
  key :text
end

class Lilyputting
  include Scrapify::Base
  html "http://liliputing.com/"
  
  attribute :text, xpath: "//h2/a"
  attribute :href, xpath: "//h2/a/@href"
  
  key :text
end

class Wired
  include Scrapify::Base
  html "http://www.wired.com/"
  
  attribute :text, xpath: "//h1/a"
  attribute :href, xpath: "//h1/a/@href"
  
  key :text
end

class SingularityHub
  include Scrapify::Base
  html "http://singularityhub.com/"
  
  attribute :text, xpath: "//h2/a"
  attribute :href, xpath: "//h2/a/@href"
  
  key :text
end


