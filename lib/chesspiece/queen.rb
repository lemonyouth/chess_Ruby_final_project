class Queen < Pieces
  attr_accessor :color, :position

  def initialize(color, position)
    @color = color
    @position = position
  end

  def valid_move?(new_position)
    # Implement valid_move? logic for the Queen
    if new_position[0]<0 || new_position[0]>7 || new_position[1]<0||new_position[1]>7
      puts "new position illegal"
      return false
    end
    if (new_position[0] == position[0] || new_position[1] == position[1] ||
      (new_position[0] - position[0]).abs == (new_position[1] - position[1]).abs)


      return true
    else
      #puts "illegal movement for queen"
      return false
    end

  end

  def to_s
    @color == 'white' ? '♕' : '♛'
  end
end
