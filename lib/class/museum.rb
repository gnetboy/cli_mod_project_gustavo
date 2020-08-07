require 'pry'
puts "museum loaded"
class Museum
    
   attr_accessor :name,:city,:state,:description,:type,:url
    
     @@all=[]
     
   def initialize(name,url)
      @name=name
      @url=url
      @@all << self
   end
       
   def self.museum_list
      self.all.each_with_index {|a,i| puts "#{i+1} #{a.name}"}
   end
   
   def self.all
      @@all.sort_by(&:name)
   end 



end 
