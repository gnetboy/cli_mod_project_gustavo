puts 'cli loaded'
class CLI
   
    def initialize
       @scrape=Scraper.new
       @user_input=nil
    end
    
    def run
        # system "clear "
        @scrape.scrape_top
        welcome
        main_menu
        
    
    end
    
    def welcome
      puts <<~WELCOME
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
        Welcome to my app Museums being thounsands of
        museums in the country we will only search for 
        museums in the city of San Francisco, California.
        
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        WELCOME
    end

    
    def main_menu
        puts "\nThese are the most popular Museums in San Francisco."
        puts "\nPick a number for a little more info:"
        Museum.museum_list
    end
end
