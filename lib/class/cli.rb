class CLI
    
    def run
        Museum.create_museums
        welcome
        main_menu
    end


    def main_menu
          puts "\nThese are the most popular Museums in San Francisco."
          Museum.museum_list
          puts "\nPlease make a selection for more info:"
          @input=nil
          while @input != "exit"
           @input = gets.chomp.downcase
            if @input.to_i > 0 && @input.to_i < Museum.museum_list.length + 1
              @selection= Museum.all[@input.to_i - 1].url
              system "clear"
              add_info
              display_info
            elsif @input == 'm'
              Museum.museum_list
            elsif @input == "e"
              puts "Goodbye!"
              exit
            else
              puts "\nSorry, I didn't understand that."
              sleep(2)
              Museum.museum_list 
            end
          end
        end
        
        def add_info
          site = Nokogiri::HTML(open("http://www.museumsusa.org/#{@selection}"))
          @type = site.css('div.asection:nth-child(4) > p:nth-child(4)').text
          @description= site.css('div.asection:nth-child(3) > p:nth-child(3)').text
          @address= site.css('div.body:nth-child(2) > div:nth-child(1)').text.gsub(/[\t\n\r]/,' ').split(' ')
          @hours= site.css('.textbox').css('.body').text.gsub(/[\t\n\r]/,' ').split(' ')
        end
        
        def display_info
          puts "\nType 'm'to show the menu to exit type 'e':"
          puts  "\n#{Museum.all[@input.to_i - 1].name.wrap_to_limit(60)}"
          puts  "\nDescription: #{@description.wrap_to_limit(60)}"
          puts  "\nType: #{@type.wrap_to_limit(60)}"
          puts  "\nAddress: #{@address.join(' ').wrap_to_limit(60)}"
          puts  "\nHours: #{@hours.join(' ').wrap_to_limit(75)}"
        end


        def welcome
          puts <<~WELCOME
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            
            Welcome to my app Museums being thousands of
            museums in the country we will only search for 
            museums in the city of San Francisco, California.
            
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            WELCOME
        end

end