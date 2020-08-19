

class Cli 
    
@@world = []

def run 
    info = Api.new.world_data
    @@world = Country.new(info)
introduction
end


    def introduction
puts <<-LIST

Welcome to the Covid-19 country statistics information, where you also have the option to compare the statistics of a country to the world statistics.

1. Australia
2. China
3. Cuba
4. Italy
5. Kenya
6. Mexico
7. Peru
8. Turkey 

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
        puts "#{stats.country} has #{stats.confirmed} confirmed cases. Info last updated: #{stats.last_update}."
        puts ""
        puts "Would you like to compare this to the World Statistics? (y/n)"
        compare = gets.strip.downcase
        if compare == "y"
        puts ""
        puts "There are #{@@world.confirmed} confirmed cases in the world."
        local = (stats.confirmed).to_f
        world = (@@world.confirmed).to_f
        percent = (100 * (local / world))
        puts ""
        puts "#{stats.country} has #{percent}% of the confirmed cases in the world."
        puts ""
        end 
    when "2"
        puts ""
        puts "#{stats.country} has #{stats.recovered} recovered cases.  Info last updated: #{stats.last_update}."  
        puts ""
        puts "Would you like to compare this to the World Statistics? (y/n)"
        compare = gets.strip.downcase
        if compare == "y"
            puts ""
            puts "There are #{@@world.recovered} recovered cases in the world."
            local = (stats.recovered).to_f
            world = (@@world.recovered).to_f
            percent = (100 * (local / world))
            puts ""
            puts "#{stats.country} has #{percent}% of the recovered cases in the world."
            puts ""
            end 
    when "3"
        puts ""
        puts "#{stats.country} has #{stats.critical} critical cases.  Info last updated: #{stats.last_update}."
        puts ""
        puts "Would you like to compare this to the World Statistics? (y/n)"
        compare = gets.strip.downcase
        if compare == "y"
            puts ""
            puts "There are #{@@world.critical} critical cases in the world."
            local = (stats.critical).to_f
            world = (@@world.critical).to_f
            percent = (100 * (local / world))
            puts ""
            puts "#{stats.country} has #{percent}% of the critical cases in the world."
            puts ""
            end 
    when "4"
        puts ""
        puts "#{stats.country} has #{stats.deaths} deaths.  Info last updated: #{stats.last_update}."
        puts ""
        puts "Would you like to compare this to the World Statistics? (y/n)"
        compare = gets.strip.downcase
        if compare == "y"
            puts ""
            puts "There are #{@@world.deaths} Covid-19 deaths in the world."
            local = (stats.deaths).to_f
            world = (@@world.deaths).to_f
            percent = (100 * (local / world))
            puts ""
            puts "#{stats.country} has #{percent}% of the Covid-19 deaths in the world."
            puts ""
            end 
    else
        puts ""
        puts "That is not a valid entry."
        puts ""
    end
    end #ends While
    introduction
end # ends DEF Level2Menu 

end 