require 'pry'


class Museum
    
   attr_accessor :name,:city,:state,:description,:type,:url
    
     @@all=[]
     
   def initialize(name,type)
      @name=name
      @type=type
      @@all << self if @@all.none?(self)
   end
   
   def self.all
      @@all.sort_by(&:name)
   end 

   #first scrape museums names and description only.
   def museums
      scrape=Scraper.new
      scrape.museum_name #initializes articles
      binding.pry
   end  
   
    def list_museums #top 10 headlines to console
        self.all.each.with_index(1) do |a, i|
           unless i > 63
            puts " #{i}. #{a.name}"
            puts "#{i}. #{a.type}"
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
m=Museum.new
m.