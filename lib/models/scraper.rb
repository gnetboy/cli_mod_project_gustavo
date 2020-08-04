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
      museums_info=[]
      city_urls.each do |city_url|
        url="http://www.museumsusa.org#{city_url}"
        html=open(url)
        doc=Nokogiri::HTML(html)
        museums_url << doc.css('.itemGroup').css('div.basic:nth-child(2)')
       end
      museum_name(museums_url)
    end    
    
    def museum_name(museums_url)
        museum_title=[]
        museums_url.each do |museum|
        name= museum.css('div.basic:nth-child(2) > div:nth-child(1)').css('a:nth-child(1)').text
        type= museum.css('.type').text
        museum = {
          :name => name,
          :type => type
        }
        museum_title << museum
      end
      museum_title
      add_attributes(museums_url)
    end
    
    def add_attributes(museums_url)
      museums=[]
      museums_url.each do |museum|
        location = museum.css('.location').text.split(', ')
        url= museum.css('a').attr('href').value
        description = museum.css('.abstract').text
        
         attributes = {
           :description => description,
           :city => location[0],
           :state => location[1],
           :link => url
         }
           museums << attributes
       end
       museums
    end
   
end
#doc.css('.itemGroup').css('div.basic:nth-child(2)').css('div.basic:nth-child(2) > div:nth-child(1)').css('a:nth-child(1)').text
#to run type ruby ./lib/scraper.rb