class FuelService 
  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |f|
      f.params["api_key"] = ENV["NREL_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def nearest_station(address)
    get_url("/api/alt-fuel-stations/v1/nearest.json?&location=#{address}&fuel_type=ELEC&limit=1")
  end
end
