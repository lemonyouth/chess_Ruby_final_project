class King < Pieces
  attr_accessor :color, :position
  def initialize(color, position)
    @color = color
    @position = position
  end

  def valid_move?(new_position)
    if new_position[0]<0 || new_position[0]>7 || new_position[1]<0||new_position[1]>7
      puts "new position illegal"
      return false
    elsif new_position[0]-position[0]).abs > 1 || (new_position[1]-position[1]).abs > 1
        puts "illegal movement for King"
        return false
    end
    return true
  end

  def to_s
    if @color == 'white'
      '♔'
    else
      '♚'
    end
  end


end
