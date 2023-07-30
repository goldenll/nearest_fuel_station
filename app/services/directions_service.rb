class DirectionsService 
  def conn
    Faraday.new(url: "https://www.mapquestapi.com") do |f|
      # f.params["api_key"] = ENV["MAPQUEST_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def directions(address1, address2)
    get_url("/directions/v2/route?key=#{ENV['MAPQUEST_KEY']}&from=#{address1}&to=#{address2}")
  end
end

