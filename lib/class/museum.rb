require 'pry'
puts "museum loaded"
class Museum
    
   attr_accessor :name,:location,:description,:type,:url,:address,:hours
    
     @@all=[]
     
   def initialize(name,url)
      @name=name
      @url=url
      @location=location
      @description=description
      @address=address
      @hours=hours
      @type=type
      @@all << self
   end

   def self.all
      @@all
   end 

   def self.create_museums
      Scraper.scrape_top
   end

       
   def self.museum_list
      self.all.each_with_index {|a,i| puts "#{i+1} #{a.name}"}
   end

 
end 
