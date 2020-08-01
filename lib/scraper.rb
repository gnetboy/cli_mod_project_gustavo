require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
   
  def scrape_city_urls
      california_url="http://www.museumsusa.org/museums/?k=1271400%2cState%3aCA%3bDirectoryID%3a200454"
      html=open(california_url)
      doc=Nokogiri::HTML(html)
      cities=doc.css('#categoryid').css('.browseCategoryItem').css('a')
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
          
        museums_list << doc.css('div.itemGroup').css('.item').css('.basic')
        end
        binding.pry
    end

    # def create_museums(museums_list)
    #     museums_list.each do |museum|
    #      museums_list.css('div.basic:nth-child(2) > div:nth-child(1)').css('#ctl12_ctl00_rptContacts_org_0 > a:nth-child(1)').text
    #      binding.pry
          
    #     end
    # end

   
end

scrape=Scraper.new
scrape.scrape_city_urls