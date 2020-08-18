class Information 

attr_accessor :name, :info 

@@raw_data = []
@@all = []

def run
    create_country_info
    @@raw_data = Api.new(country_name).country_api
    parse_info
    return_level_one 
end

def create_country_info
    

def parse_info
    #put raw_data into a hash form
    c = []
    new_hash = {}
    b = a.split(",")
    b.each do |i|
      i.delete!('"')
      i.delete!('[')
      i.delete!(']')
      i.delete!('{')
      i.delete!('}')
      c.push(i)
    end
    c.each do |i|
      d = i.split(":")
    new_hash[d[0]] = d[1]
    end


    
    

end

def return_level_one

end

def return_level_two

end











end # ends the class 