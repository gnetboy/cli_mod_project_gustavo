require_relative 'scraper.rb'
puts 'cli loaded'
class CLI
   
    attr_accessor :scrape
    attr_reader :city_urls,:museums_url
    
    def run
        system "clear "
        puts <<~WELCOME
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
        Welcome to my app Museums being thoundsands of
        museums in the country we will only search for 
        museums in the city of San Francisco, California.
        
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        WELCOME
        main_menu
    end
   
    def initialize

        @scrape=Scraper.scrape_city_urls
        @user_input=nil
    end
      #first scrape museums names and description only.
    def make_museums
        museum_list=@scrape
        Museum.create_from_collection(museum_list) 
    end 
    
    def display_museums
        Museum.all.each do |museum|
            puts "#{m.name}".colorize(:blue)
            puts "  type:".colorize(:light_blue) + " #{museum.type}"
        end
    end
    
    def main_menu
        puts "\nHeres a list of all the museums in San Francisco sorted alphabetically."
        puts "\nPick a number for a little more info:"
        puts display_museums
    end
end

# cli=CLI.new
# cli.run