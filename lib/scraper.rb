require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  MAIN_PATH="http://www.museumsusa.org/museums/?k=1271404%2cCity%3aSan+Francisco%3bState%3aCA%3bDirectoryID%3a200454"
   
  def scrape_city_urls
       #This method returns the url of museums in our targe city in this case San Francisco
      doc=Nokogiri::HTML(open(MAIN_PATH))
      city_urls=[]
      cities=doc.css('.browseCategory').css('.browseCategoryItem').css('a')

      cities.each do |city|
        url =city.attribute('href').value
        city_urls << url
      end
      scrape_city_pages(city_urls)
    end
    
    def scrape_city_pages(city_urls)
      #this method returns an array of hashes with info of all the museums
      museums_list=[]
      city_urls.each do |city_url|
        doc=Nokogiri::HTML(open("http://www.museumsusa.org#{city_url}"))
        museums_list << doc.css('.itemGroup').css('div.basic:nth-child(2)')
      end
     create_museums(museums_list)
    end    
    
    
    
    def create_museums(museums_list)
      
      museums=[]
      museums_list.each do |museum|
        name = museum.css('div.basic:nth-child(2) > div:nth-child(1)').css('a:nth-child(1)').text
        location = museum.css('.location').text.split(', ')
        type= museum.css('.type').text
        description = museum.css('.abstract').text
        
        museum_info = {
          :name => name,
          :city => location[0],
          :state => location[1],
          :description => description,
          :type => type
        }
        museums << museum_info  
      end
      museums
      binding.pry 
    end
   
end
#doc.css('.itemGroup').css('div.basic:nth-child(2)').css('div.basic:nth-child(2) > div:nth-child(1)').css('a:nth-child(1)').text
#to run type ruby ./lib/scraper.rb
scrape=Scraper.new
scrape.scrape_city_urls