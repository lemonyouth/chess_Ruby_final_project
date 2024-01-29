class Bishop < Pieces
  attr_accessor :color, :position

  def initialize(color, position)
    @color = color
    @position = position
  end

  def valid_move?(new_position)
    if new_position[0]<0 || new_position[0]>7 || new_position[1]<0||new_position[1]>7
      puts "new position illegal"
      return false
    end
    unless (new_position[0] - position[0]).abs == (new_position[1] - position[1]).abs
      #puts "illegal movements for bishop"
      return false
    end
    return true
  end

  def to_s
    @color == 'white' ? '♗' : '♝'
  end
end
