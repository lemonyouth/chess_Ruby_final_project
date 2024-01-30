require_relative '../lib/board'

RSpec.describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'creates a new board with the correct initial setup' do
      # Add expectations for the initial state of the board
      expect(board.grid[1][0]).to be_a(Pawn)
      expect(board.grid[7][4]).to be_a(King)

    end
  end

  describe '#move_piece' do
    it 'moves a piece to a new position if the move is valid' do
      # Mock a piece and set its initial position
      piece = board.grid[1][0]

      # Call the move_piece method
      board.move_piece([1, 0], [2, 0])

      # Add expectations for the new state of the board
      expect(board.grid[1][0]).to be_nil
      expect(board.grid[2][0]).to eq(piece)

    end

    it 'does not move a piece if the move is not valid' do
      # Mock a piece and set its initial position
      piece = board.grid[1][1]


      # Call the move_piece method
      board.move_piece([1, 1], [2, 0])

      # Add expectations for the unchanged state of the board
      expect(board.grid[1][1]).to eq(piece)
      expect(board.grid[2][0]).to be_nil

    end
  end



end
