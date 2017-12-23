require_relative 'pieces'
class MoveError < StandardError; end
class NoPieceError < StandardError; end
class SpaceOccupiedError < StandardError; end

class Board
  attr_accessor :grid

  def self.default_grid
    Array.new(8) { Array.new(8) }
  end

  def populate(grid)
    grid.map.with_index do |row, idx|
      case idx
      when 0
        row.map.with_index do |tile, idx2|
          case idx2
          when 0,7
            tile = Rook.new([idx, idx2], "white", Board.default_grid)
          when 1,6
            tile = Knight.new([idx, idx2], "white", Board.default_grid)
          when 2,5
            tile = Bishop.new([idx, idx2], "white", Board.default_grid)
          when 3
            tile = Queen.new([idx, idx2], "white", Board.default_grid)
          when 4
            @king_w = King.new([idx, idx2], "white", Board.default_grid)
            tile = @king_w
          end
        end
      when 1
        row.map.with_index do |tile, idx2|
          tile = Pawn.new([idx, idx2], "white", Board.default_grid)
        end
      when 2, 3, 4, 5
        row.map.with_index do |tile|
          tile = NullPiece.new
        end
      when 6
        row.map.with_index do |tile, idx2|
          tile = Pawn.new([idx, idx2], "black", Board.default_grid)
        end
      when 7
        row.map.with_index do |tile, idx2|
          case idx2
          when 0,7
            tile = Rook.new([idx, idx2], "black", Board.default_grid)
          when 1,6
            tile = Knight.new([idx, idx2], "black", Board.default_grid)
          when 2,5
            tile = Bishop.new([idx, idx2], "black", Board.default_grid)
          when 3
            tile = Queen.new([idx, idx2], "black", Board.default_grid)
          when 4
            @king_b = King.new([idx, idx2], "black", Board.default_grid)
            tile = @king_b
          end
        end
      # if idx.between?(2, 5)
      #   row.map.with_index { |tile, idx2| tile = NullPiece.new([idx, idx2]) }
      # else
      #   row.map.with_index { |tile, idx2| tile = NullPiece.new([idx, idx2]) }
        #row.map { |tile| tile = Piece.new }
      end
    end
  end

  def initialize(grid = Board.default_grid)
    @grid = self.populate(grid)
    update_piece_board
  end

  def in_check?(color)
    opp_king = (color == "white" ? @king_b : @king_w)
    grid.each do |row|
      row.each do |tile|
        return true if tile.moves.include?(opp_king.current_pos)
      end
    end

    false
  end

  

  def update_piece_board
    pieces = @grid.flatten.select { |tile| tile.class != NullPiece }
    pieces.each do |piece|
      piece.board = @grid
    end

    nil
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].nil?
      raise NoPieceError
    elsif self[start_pos].moves.include?(end_pos) == false
      raise MoveError
    elsif self[end_pos].class != NullPiece
      raise SpaceOccupiedError
    end

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
    self[end_pos].current_pos = end_pos

    update_piece_board
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

end
