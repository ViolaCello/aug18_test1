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
        Api.new("Australia").country_api
    when "2" 
        puts "China"
        Api.new("China").country_api
    when "3"
        puts "Cuba"
        Api.new("Cuba").country_api
    when "4"
        puts "Italy"
        Api.new("Italy").country_api
    when "5"
        puts "Kenya"
        Api.new("Kenya").country_api
    when "6"
        puts "Mexico"
        Api.new("Mexico").country_api
    when "7" 
        puts "Peru"
        Api.new("Peru").country_api
    when "8"
        puts "Turkey"
        Api.new("Turkey").country_api
    when "9"
        puts "World Statistics"
        Api.new("World").world_data
    when "list" 
        introduction
    when "exit"
        exit
    else
        puts "Not a valid entry.  Please try again."
        end
    end
end


end 