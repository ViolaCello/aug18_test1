class CliProject
    
@@world = []


def run 
    # Load the World Statistics so that they are immediately available for comparisons. 
    info = Api.new.world_data
    @@world = Country.new(info) # Save it into the CLI Class so that it's always at the ready
    introduction # go to the #introduction to welcome the user
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
menu # go to the Menu to prompt the user as to what they may want to do
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
        choice = "Australia"
       find_or_create(choice)
    when "2" 
        puts ""
        puts "China"
        puts ""
        choice = "China"
        find_or_create(choice)
    when "3"
        puts ""
        puts "Cuba"
        puts ""
        choice = "Cuba"
        find_or_create(choice)
    when "4"
        puts ""
        puts "Italy"
        puts ""
        choice = "Italy"
        find_or_create(choice)
    when "5"
        puts ""
        puts "Kenya"
        puts ""
        choice = "Kenya"
        find_or_create(choice)
    when "6"
        puts ""
        puts "Mexico"
        puts ""
        choice = "Mexico"
        find_or_create(choice)
    when "7" 
        puts ""
        puts "Peru"
        puts ""
        choice = "Peru"
        find_or_create(choice)
    when "8"
        puts ""
        puts "Turkey"
        puts ""
        choice = "Turkey"
        find_or_create(choice)
   
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

def level_two_menu(stats)

    #stats is the Country instance that we're currently working on, whether it was newly created or existed already

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
        comparison(stats, input)

        # The camparison method is now responsible for generating the next level menu.  This saves computer memory.
       
        # This is how each of the 4 When statements would have continued:

        # puts "Would you like to compare this to the World Statistics? (y/n)"
       # compare = gets.strip.downcase
        #if compare =="y"
       # puts ""
        #puts "There are #{@@world.confirmed} confirmed cases in the world."
       # local = (stats.confirmed).to_f
       # world = (@@world.confirmed).to_f
       # percent = (100 * (local / world))
       # puts ""
       # puts "#{stats.country} has #{percent}% of the confirmed cases in the world."
       # puts ""
       # elsif compare == "n"
       #     puts "Ok, I will return you to the menu for the statistics for #{stats.country}."
       # else
       #     puts "That was not a vaild response.  Returning you to the statistics menu for #{stats.country}"
    #end  

    when "2"
        puts ""
        puts "#{stats.country} has #{stats.recovered} recovered cases.  Info last updated: #{stats.last_update}."  
        puts ""
        comparison(stats, input)
        
    when "3"
        puts ""
        puts "#{stats.country} has #{stats.critical} critical cases.  Info last updated: #{stats.last_update}."
        puts ""
        comparison(stats, input)
        
    when "4"
        puts ""
        puts "#{stats.country} has #{stats.deaths} deaths.  Info last updated: #{stats.last_update}."
        puts ""
        comparison(stats, input)
    end

    end #ends While

    introduction # Go back to the main menu 

end 


def comparison(stats, choice)

# bringing over the user's choice of what statistic they wanted and then setting the variable to match it here in this method
# avoids having to retype the contents of the Loop for each type of statistic. Set it once then let it happen on its own.

if choice == "1" 
    local = stats.confirmed
    world = @@world.confirmed
    type = "confirmed cases"
elsif choice == "2"
    local = stats.recovered
    world = @@world.recovered
    type = "recovered cases"
elsif choice == "3"
    local = stats.critical
    world = @@world.critical
    type = "critical cases"
else
    local = stats.deaths
    world = @@world.deaths
    type = "Covid deaths"
end

    compare = nil
    loop do  # The Loop is mainly in case User enters something other than y or n 
    puts "Would you like to compare this to the World Statistics? (y/n)"
    compare = gets.strip.downcase
    if compare =="y"
    puts ""
    puts "There are #{world} #{type} in the world."
    local_math = local.to_f
    world_math = world.to_f
    percent = (100 * (local_math / world_math))
    puts ""
    puts "#{stats.country} has #{percent}% of the #{type} in the world."
    puts ""
    break # since there is no need to ask to display the same information again, end the Loop Do here
  
    elsif compare == "n"
        puts "Ok, I will return you to the menu for the statistics for #{stats.country}."
        level_two_menu(stats)
       else
        puts "That was not a valid response."
        end  
    end
end 



def find_or_create(choice)
    # This method avoids re-creating countries that already exist, thus saving computer and system memory
 
find = Country.all.detect{|o| o.country == choice}
if find == nil
    create = Api.new.country_api(choice)
    level_two_menu(create)
else
     level_two_menu(find)
    end
end


end 