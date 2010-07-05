
class GameOfLife
  attr_accessor :state

  def initialize(width = 5, height = width)
    @state = Array.new(width) { Array.new(height) { rand 2 } }
  end

  def evolve
    new_state = []
    @state.each_with_index do |row,x|
      new_state << []
      row.each_with_index do |cell,y|
        new_state[x] << cell
        nb = nb_neighbours_alive(x,y)
        if nb < 2 or nb > 3
          new_state[x][y] = 0
        elsif nb == 3
          new_state[x][y] = 1
        end
      end
    end
    @state = new_state
  end

  def neighbours(x,y)

    width = @state.size
    prev_x = x - 1
    next_x = x == width-1 ? 0 : x + 1

    height = @state[0].size
    prev_y = y - 1
    next_y = y == height-1 ? 0 : y + 1

    neighbours = []
    neighbours << @state[prev_x][prev_y]
    neighbours << @state[x][prev_y]
    neighbours << @state[next_x][prev_y]
    neighbours << @state[next_x][y]
    neighbours << @state[next_x][next_y]
    neighbours << @state[x][next_y]
    neighbours << @state[prev_x][next_y]
    neighbours << @state[prev_x][y]
    neighbours
  end

  def nb_neighbours_alive(x,y)
    nb=0
    neighbours(x,y).each {|it| nb += 1 if it == 1}
    nb
  end

end
