class Country

    @@all = []
attr_accessor :country, :confirmed, :recovered, :critical, :deaths

def initialize(info)
    @country = info["country"]
    @confirmed = info["confirmed"].to_i
    @recovered = info["recovered"].to_i
    @critical = info["critical"].to_i
    @deaths = info["deaths"].to_i
    @@all.push(self)
end

end #ends Class