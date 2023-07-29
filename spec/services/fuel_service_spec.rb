require "rails_helper"

RSpec.describe "fuel service" do 
  it "returns the closest electric fuel station to a given address" do 
    search = FuelService.new.nearest_station("4200+Tennyson+St+Denver+CO")
    station = search[:fuel_stations].first

    expect(search).to be_a(Hash)
    expect(search).to have_key(:fuel_stations)
    expect(search[:fuel_stations].count).to eq(1)
    expect(search[:fuel_stations]).to be_an(Array)
    expect(search[:fuel_stations].first).to be_a(Hash)
    expect(station).to have_key(:station_name)
    expect(station[:station_name]).to be_a(String)
    expect(station).to have_key(:street_address)
    expect(station[:street_address]).to be_a(String)
    expect(station).to have_key(:fuel_type_code)
    expect(station[:fuel_type_code]).to be_a(String)
    expect(station).to have_key(:access_days_time)
    expect(station[:access_days_time]).to be_a(String)
  end
end
