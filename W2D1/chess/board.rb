require_relative 'pieces'
class NoPieceError < StandardError; end
class SpaceOccupiedError < StandardError; end

class Board
  attr_accessor :grid

  def self.default_grid
    Array.new(8) { Array.new(8) }
  end

  def populate(grid)
    grid.map.with_index do |row, idx|
      if idx.between?(2, 5)
        row.map { |tile| tile = nil }
      else
        row.map { |tile| tile = Piece.new }
      end
    end
  end

  def initialize(grid = Board.default_grid)
    @grid = self.populate(grid)
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].nil?
      raise NoPieceError
    elsif self[end_pos].class == Piece
      raise SpaceOccupiedError
    end

    self[end_pos] = self[start_pos]
    self[start_pos] = nil
    # add: change tile's position
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
