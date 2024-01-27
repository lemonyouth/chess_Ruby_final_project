class Knight < Pieces
  attr_accessor :color, :position

  def initialize(color, position)
    @color = color
    @position = position
  end

  def valid_move?(new_position)
    # Implement valid_move? logic for the Knight
    x_diff = (new_position[0] - @position[0]).abs
    y_diff = (new_position[1] - @position[1]).abs
    (x_diff == 2 && y_diff == 1) || (x_diff == 1 && y_diff == 2)
  end

  def to_s
    @color == 'white' ? '♘' : '♞'
  end
end
