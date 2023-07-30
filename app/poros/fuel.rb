class Fuel
  attr_reader :name, 
              :address, 
              :fuel_type,
              :access_times

  def initialize(data)
    @name = data[:fuel_stations][0][:station_name]
    @address = data[:fuel_stations][0][:street_address]
    @fuel_type = data[:fuel_stations][0][:fuel_type_code]
    @access_times = data[:fuel_stations][0][:access_days_time]
  end
end
