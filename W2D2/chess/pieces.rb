require_relative 'board'

module SlidingPiece
  def move_dirs
    dirs = {
      :diagonal => [[1,1], [1,-1], [-1,1], [-1,-1]],
      :vertical => [[1,0], [-1,0]],
      :horizontal => [[0,1], [0,-1]]
    }
  end
end

module SteppingPiece
  def move_dirs
    dirs = {
      :diagonal => [[1,1], [1,-1], [-1,1], [-1,-1]],
      :vertical => [[1,0], [-1,0]],
      :horizontal => [[0,1], [0,-1]],
      :knight => [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [-1,2], [1,-2], [-1,-2]]
    }
  end
end

class Piece
  attr_reader :color
  attr_accessor :current_pos, :moves, :board
  #removed board arg below
  def initialize(current_pos, color, board)
    @current_pos = current_pos
    @color = color
    @board = board
  end

  def moves
    @moves = []
  end

  def valid_move?(pos)
    if pos.all? { |coord| coord.between?(0,7) } && @board[pos.first][pos.last].class != Piece
      true
    else
      false
    end
  end

end

class King < Piece
  include SteppingPiece
  attr_reader :face
  #removed board arg below
  def initialize(current_pos, color, board)
    super#(current_pos)
    color == "black" ? @face = "\u265A" : @face = "\u2654"
  end

  def moves
    @moves = []
    move_dirs.each do |dir, positions|
      next if dir == :knight
      positions.each do |coord|
        next_move = [current_pos.first + coord.first, current_pos.last + coord.last]
        @moves << next_move if valid_move?(next_move)
      end
    end

    @moves
  end
end

class Knight < Piece
  include SteppingPiece
  attr_reader :face
  #removed board arg below
  def initialize(current_pos, color, board)
    super#(current_pos)
    color == "black" ? @face = "\u265E" : @face = "\u2658"
  end

  def moves
    @moves = []
    move_dirs.each do |dir, positions|
      next if dir != :knight
      positions.each do |coord|
        next_move = [current_pos.first + coord.first, current_pos.last + coord.last]
        @moves << next_move if valid_move?(next_move)
      end
    end

    @moves
  end
end

class Bishop < Piece
  include SlidingPiece
  attr_reader :face
  #removed board arg below
  def initialize(current_pos, color, board)
    super
    color == "black" ? @face = "\u265D" : @face = "\u2657"
  end

  def moves
    @moves = []
    move_dirs[:diagonal].each do |coord|
      next_move = [current_pos.first + coord.first, current_pos.last + coord.last]
      until !valid_move?(next_move)
        @moves << next_move
        next_move = [next_move.first + coord.first, next_move.last + coord.last]
      end
    end

    @moves
  end
end

class Rook < Piece
  include SlidingPiece

  attr_reader :face
  #removed board arg below
  def initialize(current_pos, color, board)
    super
    color == "black" ? @face = "\u265C" : @face = "\u2656"
  end

  def moves
    @moves = []
    move_dirs.each do |dir, positions|
      next if dir == :diagonal
      positions.each do |coord|
        next_move = [current_pos.first + coord.first, current_pos.last + coord.last]
        until !valid_move?(next_move)
          @moves << next_move
          next_move = [next_move.first + coord.first, next_move.last + coord.last]
        end
      end
    end

    @moves
  end

end

class Queen < Piece
  include SlidingPiece

  attr_reader :face
  #removed board arg below
  def initialize(current_pos, color, board)
    super
    color == "black" ? @face = "\u265B" : @face = "\u2655"
  end

  def moves
    @moves = []
    move_dirs.each do |dir, positions|
      positions.each do |coord|
        next_move = [current_pos.first + coord.first, current_pos.last + coord.last]
        until !valid_move?(next_move)
          @moves << next_move
          next_move = [next_move.first + coord.first, next_move.last + coord.last]
        end
      end
    end

    @moves
  end
end

class Pawn < Piece
  WHITE_MOVE_DIRS = [[1,0], [1,1], [1,-1]]
  BLACK_MOVE_DIRS = [[-1,0], [-1,-1], [-1,1]]

  attr_reader :face, :color
  #removed board arg below
  def initialize(current_pos, color, board)
    super
    color == "black" ? @face = "\u265F" : @face = "\u2659"
  end

  def moves
    @moves = []

    case @color
    when "white"
      WHITE_MOVE_DIRS.each do |coord|
        next_move = [current_pos.first + coord.first, current_pos.last + coord.last]
        @moves << next_move if valid_move?(next_move)
      end
    when "black"
      BLACK_MOVE_DIRS.each do |coord|
        next_move = [current_pos.first + coord.first, current_pos.last + coord.last]
        @moves << next_move if valid_move?(next_move)
      end
    end

    @moves
  end
end



class NullPiece < Piece
  attr_reader :face
  def initialize
    @face = :n
  end
end
