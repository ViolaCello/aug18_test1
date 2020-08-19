require 'pry'
class Cli 
    
    def introduction
puts <<-LIST
Welcome to the Covid-19 country statistics comparer.
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

    input = gets.strip.downcase
    case input
    when "1"
        puts "Australia"
       create = Api.new.country_api("Australia")
       level_two_menu(create)
    when "2" 
        puts "China"
        create = Api.new("China").country_api
        level_two_menu(create)
    when "3"
        puts "Cuba"
        create =Api.new("Cuba").country_api
        level_two_menu(create)
    when "4"
        puts "Italy"
        create =Api.new("Italy").country_api
        level_two_menu(create)
    when "5"
        puts "Kenya"
        create =Api.new("Kenya").country_api
        level_two_menu(create)
    when "6"
        puts "Mexico"
        create = Api.new("Mexico").country_api
        level_two_menu(create)
    when "7" 
        puts "Peru"
        create = Api.new("Peru").country_api
        level_two_menu(create)
    when "8"
        puts "Turkey"
        create =Api.new("Turkey").country_api
        level_two_menu(create)
    when "9"
        puts "World Statistics"
        create = Api.new("World").world_data
        level_two_menu(create)
    when "list" 
        introduction
    when "exit"
        exit
    else
        puts "Not a valid entry.  Please try again."
        end
    end
end

def level_two_menu(info)
    stats = Country.new(info)

    input = nil
    while input !="exit" do 

    puts "Please select a statistic you would like to know for #{stats.country}."
    puts "Type 1 for number of Confirmed cases."
    puts "Type 2 for number of Recovered cases."
    puts "Type 3 for number of Critical cases."
    puts "Type 4 for number of Deaths in #{stats.country}."
    puts "Type exit to be returned to the Main Menu."

    input = gets.strip.downcase
    case input
    when "1"
        puts "#{stats.country} has #{stats.confirmed} confirmed cases."
    when "2"
        puts "#{stats.country} has #{stats.recovered} recovered cases."  
    when "3"
        puts "#{stats.country} has #{stats.critical} critical cases."
    when "4"
        puts "#{stats.country} has #{stats.deaths} deaths."
    else
        puts "Please type a number 1 through 4 or type exit."
    end
    end #ends While
    introduction
end # ends DEF Level2Menu 



end 