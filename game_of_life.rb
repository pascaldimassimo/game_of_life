
class GameOfLife
  attr_accessor :state

  def initialize(width = 5, height = width)
    @state = Array.new(width) { Array.new(height) { rand 2 } }
  end

  def evolve
    @state
  end

end

g = GameOfLife.new(5)
puts g.state.inspect
