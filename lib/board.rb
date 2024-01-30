require_relative './chesspiece/pieces'
require_relative './chesspiece/bishop'
require_relative './chesspiece/king'
require_relative './chesspiece/knight'
require_relative './chesspiece/pawn'
require_relative './chesspiece/queen'
require_relative './chesspiece/rook'

class Board
  attr_accessor :grid, :white_king, :black_king
  def initialize
    @grid = Array.new(8) {Array.new(8, nil)}
    # Initialize Pawns
    (0..7).each do |i|
      @grid[1][i] = Pawn.new('black', [1, i])
      @grid[6][i] = Pawn.new('white', [6, i])
    end

    @white_king = King.new('white',[7, 4]);
    @black_king = King.new('black',[0, 4]);
    # Initialize other pieces for the black side
    @grid[0][0] = Rook.new('black', [0, 0])
    @grid[0][1] = Knight.new('black', [0, 1])
    @grid[0][2] = Bishop.new('black', [0, 2])
    @grid[0][3] = Queen.new('black', [0, 3])
    @grid[0][4] = @black_king
    @grid[0][5] = Bishop.new('black', [0, 5])
    @grid[0][6] = Knight.new('black', [0, 6])
    @grid[0][7] = Rook.new('black', [0, 7])

    # Initialize other pieces for the white side
    @grid[7][0] = Rook.new('white', [7, 0])
    @grid[7][1] = Knight.new('white', [7, 1])
    @grid[7][2] = Bishop.new('white', [7, 2])
    @grid[7][3] = Queen.new('white', [7, 3])
    @grid[7][4] = @white_king
    @grid[7][5] = Bishop.new('white', [7, 5])
    @grid[7][6] = Knight.new('white', [7, 6])
    @grid[7][7] = Rook.new('white', [7, 7])
  end

  def move_piece(old_posi, new_posi)
    piece = @grid[old_posi[0]][old_posi[1]]
    if piece.valid_move?(new_posi)
      set_piece(new_posi,piece)
      piece.position = new_posi
      set_piece(old_posi,nil)
    else
      puts "Not a valid move for #{piece}"
    end
  end

  def set_piece(position, set_piece)
    @grid[position[0]][position[1]] = set_piece
  end

  def checkmate(piece)
    if(piece.color == 'white')
      if(piece.valid_move?(@black_king.position) && not_intervene_other?(piece, @black_king.position))
        puts "white #{piece} checkmate"
      end
    else
      if(piece.valid_move?(@white_king.position) && not_intervene_other?(piece, @white_king.position))
        puts "black #{piece} checkmate"
      end
    end
  end

  def print_board
    (0..7).each do |row|
      (0..7).each do |column|
        piece = @grid[row][column]
        print piece.nil? ? " - " : " #{piece} "
      end
      puts "\n"
    end
  end

  def not_intervene_other?(piece, new_posi)
    if piece.is_a?(Knight)
      return true
    elsif piece.is_a?(Bishop)
      sign0 = (new_posi[0]-piece.position[0])/(new_posi[0]-piece.position[0]).abs
      sign1 = (new_posi[1]-piece.position[1])/(new_posi[1]-piece.position[1]).abs
      for i in 1...(new_posi[0]-piece.location[0]).abs
        if @grid[piece.position[0]+i*sign0][piece.position[1]+i*sign1] != nil
          return false
        end
      end
      return true
    elsif piece.is_a?(Queen)
      if piece.position[0] == new_posi[0]
        sign = (new_posi[1]-piece.position[1])/(new_posi[1]-piece.position[1]).abs
        for i in 1...(new_posi[1]-piece.position[1]).abs
          if @grid[new_posi[0]][piece.position[1]+i*sign] != nil
            return false
          end
        end
      elsif piece.position[1] == new_posi[1]
        sign = (new_posi[0]-piece.position[0])/(new_posi[0]-piece.position[0]).abs
        for i in 1...(new_posi[0]-piece.position[0]).abs
          if @grid[piece.position[0]+i*sign][new_posi[1]] != nil
            return false
          end
        end
      else
        sign0 = (new_posi[0]-piece.position[0])/(new_posi[0]-piece.position[0]).abs
        sign1 = (new_posi[1]-piece.position[1])/(new_posi[1]-piece.position[1]).abs
        for i in 1...(new_posi[0]-piece.position[0]).abs
          if @grid[piece.position[0]+i*sign0][piece.position[1]+i*sign1] != nil
            return false
          end
        end
      end
      return true

    elsif piece.is_a?(Rook)
      if piece.position[0] == new_posi[0]
        sign = (new_posi[1]-piece.position[1])/(new_posi[1]-piece.position[1]).abs
        for i in 1...(new_posi[1]-piece.position[1]).abs
          if @grid[new_posi[0]][piece.position[1]+i*sign] != nil
            return false
          end
        end
      else
        sign = (new_posi[0]-piece.position[0])/(new_posi[0]-piece.position[0]).abs
        for i in 1...(new_posi[0]-piece.position[0]).abs
          if @grid[piece.position[0]+i*sign][new_posi[1]] != nil
            return false
          end
        end
      end
      return true
    elsif piece.is_a?(King)
      return true
    elsif piece.is_a?(Pawn)
      return true
    else
      puts "piece does not belong to any type, error"
      return false
    end


  end
end
