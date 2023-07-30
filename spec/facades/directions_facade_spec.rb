require "rails_helper"

RSpec.describe DirectionsFacade do 
  it "returns directions when given two addresses" do 
    directions = DirectionsFacade.new.get_directions("4200+Tennyson+St+Denver+CO", "5809+W+44th+Ave+Denver+CO")

    expect(directions).to be_a(Directions)
    expect(directions.distance).to be_a(Float)
    expect(directions.travel_time).to be_a(String)
    expect(directions.narrative).to be_an(Array)
  end
end
