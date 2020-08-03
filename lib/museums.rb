require 'pry'

class Museum
    
     attr_accessor :name,:city,:state,:description,:type
    
        @@all=[]
    
     def initialize(museum_hash)
        @name = museum_hash[:name]
        @city = museum_hash[:city]
        @state = museum_hash[:state]
        @description = museum_hash[:type]
        @@all << self
     end


     def self.create_from_collection(museums)
        museums.each do |museum_hash|
            Museum.new(museum_hash)
        end
     end

     def self.all
        @@all.sort_by(&:type)
     end 

end 