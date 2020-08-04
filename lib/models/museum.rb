require 'pry'


class Museum
    
   attr_accessor :name,:city,:state,:description,:type,:url
    
     @@all=[]
     
   def initialize(name,type)
      @scrape=Scraper.new
      @name=name
      @type=type
      @@all << self if @@all.none?(self)
   end
   
   def self.all
      @@all.sort_by(&:name)
   end 

   #first scrape museums names and description only.
   def make_museums
      @scrape.scrape_city_urls
      scrape_city_pages(city_urls)
      museum_name(museums_url)
      binding.pry
   end  
   
    def list_museums(museum_title)
        self.all.each.with_index(1) do |a, i|
           unless i > self.all.size
            puts " #{i}. #{a.name} \n #{i}. #{a.type}"
           else
            put "I don't understand that" 
           end
        end
    end


   #   def initialize(museum_hash)
   #      @name = museum_hash[:name]
   #      @city = museum_hash[:city]
   #      @state = museum_hash[:state]
   #      @description = museum_hash[:type]
   #      @@all << self
   #   end


   #   def self.create_from_collection(museums)
   #      museums.each do |museum_hash|
   #          Museum.new(museum_hash)
   #      end
   #   end


end 
