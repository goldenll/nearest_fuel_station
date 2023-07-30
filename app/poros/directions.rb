class Directions
  attr_reader :distance, 
              :travel_time, 
              :narrative

  def initialize(data)
    @distance = data[:route][:distance]
    @travel_time = data[:route][:formattedTime]
    @maneuvers = data[:route][:legs][0][:maneuvers]
    @narrative = combine_narratives(data)
  end

  def combine_narratives(data)
    @maneuvers.map do |step|
      step[:narrative]
    end
  end
end
