class CLI
    
    def run
        @user_input=nil
        welcome
        main_menu
    end
    
    def welcome
        system "clear "
        puts <<~WELCOME
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
        Welcome to my app Museums being thoundsand of
        museums in the country we will search for only
        museums in the city of San Francisco, California.
        
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        WELCOME
    end
    def show_museums
    end
    
    def main_menu
        puts "\nHeres a list of all the museums in San Francisco sorted alphabetically."
        puts "\nPick a number for a little more info:"
        #show_museums
        # until input == 'e'
        #     input=gets.strip.downcase
        #     case 
        #     when input =='e'
        #         say_goodbye
        #     when input =='n'
        #         system 'clear'
        #         list_museums
        #     when input.to_i.between?(1,list_museums.length)
        #          display_museum
        #     else
        #         puts "\nI don't understand!. Please try again.\n"
        #         keep_looping
        #     end
        # end
    end

end