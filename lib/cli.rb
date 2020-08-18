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
LIST

    end

def menu 
    
    input = nil
    while input !="exit" do 

puts "Please type the number of the country that you'd like to compare to the World Statistics,"
puts "or type exit to exit, or list to list again."

    input = gets.strip.downcase
    case input
    when "1"
        puts "Australia"
    when "2" 
        puts "China"
    when "list" 
        introduction
    when "exit"
        break 
    else
        puts "Not a valid entry.  Please try again."
        end
    end
end


end 