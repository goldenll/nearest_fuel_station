require "rails_helper"

RSpec.describe FuelFacade do 
  it "returns the closest electric fuel station to a given address" do 
    station = FuelFacade.new.get_station("4200+Tennyson+St+Denver+CO")

    expect(station).to be_a(Fuel)
    expect(station.name).to be_a(String)
    expect(station.address).to be_a(String)
    expect(station.fuel_type).to be_a(String)
    expect(station.access_times).to be_a(String)
  end
end
