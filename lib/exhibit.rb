class Exhibit
  attr_reader :name, :cost
  def initialize(name_cost)
    @name = name_cost[:name]
    @cost = name_cost[:cost]
  end

end
