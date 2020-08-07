require 'nokogiri'
require 'open-uri'
require 'pry'
puts 'scraper loaded'

class Scraper

    PAGE="http://www.museumsusa.org/museums/?k=1271404%2cCity%3aSan+Francisco%3bState%3aCA%3bDirectoryID%3a200454"
   
     attr_accessor :name, :url,:museum_list,:list_names
     
     
     def scrape_top
      @museum_list = []
      doc = Nokogiri::HTML(open(PAGE))
      title= doc.css('.itemGroup').css('div.item.basic').css('div.source')
      title.each{|info|
      name=Museum.new(name,url) #create museums instances
      name.name = info.css("a").text     #assign  name
      name.url = info.css('a').attr('href').value     
      @museum_list= name}
      Museum.all << @museum_list
    
      
    end
      
   
  


end

#doc.css('.itemGroup').css('div.basic:nth-child(2)').css('div.basic:nth-child(2) > div:nth-child(1)').css('a:nth-child(1)').text
#to run type ruby ./lib/scraper.rb