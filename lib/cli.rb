require_relative "./lib/scraper.rb"
require_relative "./lib/museums.rb"



class CommandLineInterface
    
    attr_accessor :selection,:current_sel

    @@selection=[]

    def run
        #create_museums
        #start_welcome
        #list_museums
        #keep_looping
    end

    def make_students
        students_array = Scraper.scrape_index_page(BASE_PATH + 'index.html')
        Student.create_from_collection(students_array)
      end
    
      
    # def self.keep_looping
    #     input = String.new
    #     until input == 'e'
    #         input=gets.strip.downcase
    #         case 
    #         when input =='e'
    #             say_goodbye
    #         when input =='n'
    #             system 'clear'
    #             list_museums
    #         when input.to_i.between?(1,list_museums.length)
    #              display_museum
    #         else
    #             puts "\nI don't understand!. Please try again.\n"
    #             keep_looping
    #         end
    #     end
    # end

    def self.start_welcome
        system 'clear'
        puts "Welcome"

    end
end
#CommandLineInterface.start 