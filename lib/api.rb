require 'pry'
class Api
    require 'uri'
    require 'net/http'
    require 'openssl'
    

    def world_data
    url = URI("https://covid-19-data.p.rapidapi.com/totals?format=json")
    
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'covid-19-data.p.rapidapi.com'
    request["x-rapidapi-key"] = '08507dcb2dmsh734c7c4378428e1p116926jsn2b0915eb021b'
    
    response = http.request(request)
   # puts response.read_body
   raw_data = response.body
   #convert API response into a usable hash
   temp_array = []
       info_hash ={}
       info_hash["country"] = "World"
       conversion = raw_data.split(",")
       conversion.each do |i|
         i.delete!('"')
         i.delete!('[')
         i.delete!(']')
         i.delete!('{')
         i.delete!('}')
         temp_array.push(i)
       end
       temp_array.each do |i|
         d = i.split(":")
       info_hash[d[0]] = d[1]
       end
   
   #return the info hash to then do the next step, which is to create country called World
      info_hash

    end

    
def country_api(country)
    string = country

address = "https://covid-19-data.p.rapidapi.com/country?format=json&name="+string 

url = URI(address)

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'covid-19-data.p.rapidapi.com'
request["x-rapidapi-key"] = '08507dcb2dmsh734c7c4378428e1p116926jsn2b0915eb021b'

response = http.request(request)
raw_data = response.body
#convert API response into a usable hash
temp_array = []
    info_hash = {}
    conversion = raw_data.split(",")
    conversion.each do |i|
      i.delete!('"')
      i.delete!('[')
      i.delete!(']')
      i.delete!('{')
      i.delete!('}')
      temp_array.push(i)
    end
    temp_array.each do |i|
      d = i.split(":")
    info_hash[d[0]] = d[1]
    end

#return the info hash to then do the next step, which is create new country
   info_hash
end




end 