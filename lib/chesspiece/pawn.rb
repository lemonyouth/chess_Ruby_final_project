class Pawn < Pieces
  attr_accessor :color, :position

  def initialize(color, position)
    @color = color
    @position = position
  end

  def valid_move?(new_position)
    # Implement valid_move? logic for the Pawn
    x_diff = new_position[0] - @position[0]
    y_diff = (new_position[1] - @position[1]).abs

    if @color == 'black'
      (x_diff == 1 || (x_diff == 2 && @position[0] == 1)) && y_diff == 0
    else
      (x_diff == -1 || (x_diff == -2 && @position[0] == 6)) && y_diff == 0
    end
  end

  def to_s
    @color == 'white' ? '♙' : '♟'
  end
end
