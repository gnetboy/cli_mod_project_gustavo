puts "museum loaded"
class Museum
    
   attr_accessor :name,:city,:state,:description,:type,:url
    
     @@all=[]
     
   def initialize(name,type)
      @name=museum_list[:name]
      @type=museum_list[:type]
      @@all << self 
   end
       
   def self.create_from_collection(museum_list)
      museum_list.each do |museum_hash|
            Museum.new(museum_hash)
      end
   end

   
   def self.all
      @@all.sort_by(&:name)

   end 


   #   def initialize(museum_hash)
   #      @name = museum_hash[:name]
   #      @city = museum_hash[:city]
   #      @state = museum_hash[:state]
   #      @description = museum_hash[:type]
   #      @@all << self
   #   end
end 
