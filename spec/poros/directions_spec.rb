require "rails_helper"

RSpec.describe Directions do 
  it "exists and has attributes" do 
    data = {
      :route=> {
        :distance=>2.4,
        :formattedTime=>"0:04:30",
        :legs=>[{
          :maneuvers=>[{
            :narrative=>"Turn left"
          }]
        }]
      }
    }

    directions = Directions.new(data)

    expect(directions).to be_a(Directions)
    expect(directions.distance).to eq(2.4)
    expect(directions.travel_time).to eq("0:04:30")
    expect(directions.narrative).to eq(["Turn left"])
  end

  it "can have directions with multiple steps" do 
    data = {
      :route=> {
        :distance=>7,
        :formattedTime=>"0:07:45",
        :legs=>[{
          :maneuvers=>[{
            :narrative=>"Turn left"
          },
          {
            :narrative=>"Go straight"
          },
          {
            :narrative=>"Turn right"
          }]
        }]
      }
    }

    directions = Directions.new(data)

    expect(directions).to be_a(Directions)
    expect(directions.distance).to eq(7)
    expect(directions.travel_time).to eq("0:07:45")
    expect(directions.narrative).to eq(["Turn left", "Go straight", "Turn right"])
  end
end
