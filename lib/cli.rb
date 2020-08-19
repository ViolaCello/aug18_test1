require 'pry'
class Cli 
    
    def introduction
puts <<-LIST
Welcome to the Covid-19 country statistics information.

1. Australia
2. China
3. Cuba
4. Italy
5. Kenya
6. Mexico
7. Peru
8. Turkey 
9. World Totals
LIST
menu
    end

def menu 
    input = nil
    while input !="exit" do 

puts "Please type the number of the country that you'd like the statistics,"
puts "or type exit to exit, or list to list again."
puts ""

    input = gets.strip.downcase
    case input
    when "1"
        puts ""
        puts "Australia"
        puts ""
       create = Api.new.country_api("Australia")
       level_two_menu(create)
    when "2" 
        puts ""
        puts "China"
        puts ""
        create = Api.new.country_api("China")
        level_two_menu(create)
    when "3"
        puts ""
        puts "Cuba"
        puts ""
        create =Api.new.country_api("Cuba")
        level_two_menu(create)
    when "4"
        puts ""
        puts "Italy"
        puts ""
        create =Api.new.country_api("Italy")
        level_two_menu(create)
    when "5"
        puts ""
        puts "Kenya"
        puts ""
        create =Api.new.country_api("Kenya")
        level_two_menu(create)
    when "6"
        puts ""
        puts "Mexico"
        puts ""
        create = Api.new.country_api("Mexico")
        level_two_menu(create)
    when "7" 
        puts ""
        puts "Peru"
        puts ""
        create = Api.new.country_api("Peru")
        level_two_menu(create)
    when "8"
        puts ""
        puts "Turkey"
        puts ""
        create =Api.new.country_api("Turkey")
        level_two_menu(create)
    when "9"
        puts ""
        puts "World Statistics"
        puts ""
        create = Api.new.world_data
        level_two_menu(create)
    when "list" 
        introduction
    when "exit"
        exit
    else
        puts ""
        puts "Not a valid entry.  Please try again."
        puts ""
        end
    end
end

def level_two_menu(info)
    stats = Country.new(info)

    input = nil
    while input !="exit" do 

    puts "Please select a statistic you would like to know for #{stats.country}."
    puts ""
    puts "Type 1 for number of Confirmed cases."
    puts "Type 2 for number of Recovered cases."
    puts "Type 3 for number of Critical cases."
    puts "Type 4 for number of Deaths in #{stats.country}."
    puts "Type exit to be returned to the Main Menu."
    puts ""

    input = gets.strip.downcase
    case input
    when "1"
        puts ""
        puts "#{stats.country} has #{stats.confirmed} confirmed cases."
        puts ""
    when "2"
        puts ""
        puts "#{stats.country} has #{stats.recovered} recovered cases."  
        puts ""
    when "3"
        puts ""
        puts "#{stats.country} has #{stats.critical} critical cases."
        puts ""
    when "4"
        puts ""
        puts "#{stats.country} has #{stats.deaths} deaths."
        puts ""
    else
        puts ""
        puts "Please type a number 1 through 4 or type exit."
        puts ""
    end
    end #ends While
    introduction
end # ends DEF Level2Menu 



end 