require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
   
  def scrape_city_urls
      san_francisco_url="http://www.museumsusa.org/museums/?k=1271404%2cCity%3aSan+Francisco%3bState%3aCA%3bDirectoryID%3a200454"
      html=open(san_francisco_url)
      doc=Nokogiri::HTML(html)
      cities=doc.css('.browseCategory').css('.browseCategoryItem').css('a')
      city_urls=[]

      cities.each do |city|
        url =city.attribute('href').value
        city_urls << url
      end
      scrape_city_pages(city_urls)
  end

    def scrape_city_pages(city_urls)
        
      museums_list=[]
      city_urls.each do |city_url|
      url="http://www.museumsusa.org#{city_url}"
      html=open(url)
      doc=Nokogiri::HTML(html)
      
      museums_list << doc.css('.itemGroup').css('div.basic:nth-child(2)')
      end
     create_museums(museums_list)
    end                

    def create_museums(museums_list)
        museums_list.each do |museum|
          name=museum.css('div.basic:nth-child(2) > div:nth-child(1)').css('a:nth-child(1)').text
          binding.pry
       end
    end

   
end
#doc.css('.itemGroup').css('div.basic:nth-child(2)').css('div.basic:nth-child(2) > div:nth-child(1)').css('a:nth-child(1)').text
#to run type ruby ./lib/scraper.rb
scrape=Scraper.new
scrape.scrape_city_urls