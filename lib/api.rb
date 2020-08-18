require 'pry'
class Api
    require 'uri'
    require 'net/http'
    require 'openssl'
    
attr_accessor :country 

def initialize(country)
@country = country
end


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

    end

    def italy_api
        url = URI("https://covid-19-data.p.rapidapi.com/country?format=json&name=italy")
        
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'covid-19-data.p.rapidapi.com'
        request["x-rapidapi-key"] = '08507dcb2dmsh734c7c4378428e1p116926jsn2b0915eb021b'
        
        response = http.request(request)
        puts response.read_body
    end

def china_api
    url = URI("https://covid-19-data.p.rapidapi.com/country?format=json&name=china")
    
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'covid-19-data.p.rapidapi.com'
    request["x-rapidapi-key"] = '08507dcb2dmsh734c7c4378428e1p116926jsn2b0915eb021b'
    
    response = http.request(request)
    puts response.read_body
end

def country_api
    string = self.country

address = "https://covid-19-data.p.rapidapi.com/country?format=json&name="+string 

url = URI(address)

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'covid-19-data.p.rapidapi.com'
request["x-rapidapi-key"] = '08507dcb2dmsh734c7c4378428e1p116926jsn2b0915eb021b'

response = http.request(request)
puts response.read_body
end




end 