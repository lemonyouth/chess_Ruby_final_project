require_relative './chesspiece/pieces'
require_relative './chesspiece/bishop'
require_relative './chesspiece/king'
require_relative './chesspiece/knight'
require_relative './chesspiece/pawn'
require_relative './chesspiece/queen'
require_relative './chesspiece/rook'
require_relative './board'
require_relative './player'

class Game
  attr_accessor :board, :player_white, :player_black, :cur_player
  def initialize
    @board = Board.new
    @player_black = Player.new('black')
    @player_white = Player.new('white')
    @cur_player = @player_white
  end

  def get_player_move_original_posi
    puts "enter the location of desired moving chess of #{@cur_player.color} player"
    original_posi = gets.chomp.split.map(&:to_i)
    if(@board.grid[original_posi[0]][original_posi[1]] == nil)
      puts "there is no chess on location #{original_posi}"
    elsif @board.grid[original_posi[0]][original_posi[1]].color != @cur_player.color
      puts "you desired to move the opponent's chesspiece"
    else
      return original_posi
    end
  end

  def get_player_move_final_posi()
    puts "enter the desired destination location for #{cur_player.color} player"
    final_posi = gets.chomp.split.map(&:to_i)
    return final_posi
  end

  def execute_move(original_posi, final_posi)
    piece = @board.grid[original_posi[0]][original_posi[1]]
    if piece.valid_move?(final_posi) == false
      puts "invalid move for chess #{piece} from #{original_posi} to #{final_posi}"
      return
    end
    @board.grid[final_posi[0]][final_posi[1]] = piece
    @board.grid[original_posi[0]][original_posi[1]] = nil
    if @board.checkmate(piece)
      puts "checkmate for #{piece}"
    end
  end

  def switch_player()
    @cur_player = (@cur_player.color == 'white') ? @player_black : @player_white
  end

  def game_over?
    if @board.grid[@board.white_king.position[0]][@board.white_king.position[1]].color == 'black'
      puts "black player wins!"
      return true
    elsif @board.grid[@board.black_king.position[0]][@board.black_king.position[1]].color == 'white'
      puts "white player wins!"
      return true
    end
    return false
  end

  def play()
    until game_over?
      @board.print_board
      original_posi = get_player_move_original_posi
      final_posi = get_player_move_final_posi
      execute_move(original_posi, final_posi)
      switch_player

    end

  end



end