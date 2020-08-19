class Country

    @@all = []
attr_accessor :country, :confirmed, :recovered, :critical, :deaths, :last_update

def initialize(info)
    @country = info["country"]
    @confirmed = info["confirmed"].to_i
    @recovered = info["recovered"].to_i
    @critical = info["critical"].to_i
    @deaths = info["deaths"].to_i
    @last_update = info["lastUpdate"].split("T").first
    @@all.push(self)
end


def self.all
    @@all
end

end 