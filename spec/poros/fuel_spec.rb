require "rails_helper"

RSpec.describe Fuel do 
  it "exists and has attributes" do 
    data = {
      :fuel_stations=> [{
        :station_name=>"Simon's Station",
        :street_address=>"5809 W 44th Ave",
        :fuel_type_code=>"ELEC",
        :access_days_time=>"24 hours daily"
      }]
    }

    station = Fuel.new(data)

    expect(station).to be_a(Fuel)
    expect(station.name).to eq("Simon's Station")
    expect(station.address).to eq("5809 W 44th Ave")
    expect(station.fuel_type).to eq("ELEC")
    expect(station.access_times).to eq("24 hours daily")
  end
end
