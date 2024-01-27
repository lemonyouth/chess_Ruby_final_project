class Pieces
  attr_accessor :color, :position

  def initialize(color, position)
    @color = color
    @position = position
  end

  def valid_move?(new_position)
    raise NotImplementedError, "a chess must have valid_move method"
  end
end
