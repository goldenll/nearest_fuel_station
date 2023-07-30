require "rails_helper"

RSpec.describe "directions service" do 
  it "returns directions for two addresses" do 
    search = DirectionsService.new.directions("4200+Tennyson+St+Denver+CO", "5809+W+44th+Ave+Denver+CO")
    directions_info = search[:route]
    directions_narrative = directions_info[:legs].first[:maneuvers]
    
    expect(search).to be_a(Hash)
    expect(search).to have_key(:route)
    expect(search[:route]).to be_a(Hash)
    expect(directions_info).to be_a(Hash)
    expect(directions_info).to have_key(:distance)
    expect(directions_info[:distance]).to be_an(Float)
    expect(directions_info).to have_key(:formattedTime)
    expect(directions_info[:formattedTime]).to be_a(String)
    expect(directions_info).to have_key(:legs)
    expect(directions_info[:legs]).to be_an(Array)
    expect(directions_info[:legs].first).to be_a(Hash)
    expect(directions_info[:legs].first).to have_key(:maneuvers)
    expect(directions_info[:legs].first[:maneuvers]).to be_an(Array)
    expect(directions_info[:legs].first[:maneuvers].first).to have_key(:narrative)
    expect(directions_info[:legs].first[:maneuvers].first[:narrative]).to be_a(String)
    directions_narrative.each do |narrative|
      expect(narrative).to have_key(:narrative)
      expect(narrative[:narrative]).to be_a(String)
    end
  end
end

    # :route=>
    #     [:distance]
    #     [:formattedTime]
    #     :legs=>
    #       .first (loop?)
    #         :maneuvers=>
    #           .first (loop?)
    #             :narrative


# I should also see:
# - the distance of the nearest station (should be 0.1 miles)
# - the travel time from Griffin Coffee to that fuel station (should be 1 min)
# - The direction instructions to get to that fuel station
#   "Turn left onto Lawrence St Destination will be on the left"

