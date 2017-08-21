class Location
  # stores all Store instances in an array  that are a result of a certain search term
  attr_accessor :location, :stores

  def initialize (location)
    @location = location 
    @stores = []
  end

end
