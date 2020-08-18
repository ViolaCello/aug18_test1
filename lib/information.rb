class Information 

attr_accessor :name, :info 

def run(country_name)
    @name = country_name
    Api.new(country_name).country_api


def initialize(country_name)
@name = country_name

end





end 