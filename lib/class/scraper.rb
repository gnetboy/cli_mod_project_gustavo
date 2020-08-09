require 'nokogiri'
require 'open-uri'
require 'pry'
puts 'scraper loaded'

class Scraper

    PAGE="http://www.museumsusa.org/museums/?k=1271404%2cCity%3aSan+Francisco%3bState%3aCA%3bDirectoryID%3a200454"
     
     attr_accessor :museum
      
     def self.scrape_top
         doc= Nokogiri::HTML(open(PAGE))
         title= doc.css('.itemGroup').css('div.item.basic').css('div.source')
         title.each do|info|
            name = info.css("a").text     #assign  name
            url = info.css('a').attr('href').value #get link
            museum=Museum.new(name,url) #create museums instances
          end  
      end
     
     def self.add_info
      site = Nokogiri::HTML(open("http://www.museumsusa.org/#{@@selection}"))
        museum =Hash.new
        museum[:location]= site.css('div.itemGroupHeader:nth-child(1) > h2:nth-child(1)').css('div.asection:nth-child(3) > p:nth-child(3)').text
        museum[:type] = site.css('div.asection:nth-child(4) > p:nth-child(4)').text
        museum[:description]= site.css('div.asection:nth-child(3) > p:nth-child(3)').text
        museum[:address]= site.css('div.body:nth-child(2) > div:nth-child(1)').text.gsub(/[\t\n\r]/,' ').split(' ')
        museum[:hours]= site.css('.textbox').css('.body').text.gsub(/[\r\t\n]/,' ').split(' ')
    end
  
end

