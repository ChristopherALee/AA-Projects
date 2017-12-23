require_relative 'Card'
require_relative 'Board'
require_relative 'Player'

class Game
  attr_accessor :board, :player, :blacklist

  def initialize
    @board = Board.new
    @player = Player.new("Human")
  
  end

  def play
    until game_over?
      board.display
      play_turn
    end

    puts winner
  end

  def play_turn
    move = player.get_move
    p move
    first_card = self.board[move.first].first
    second_card = self.board[move.last].first

    first_card.face_down = false
    second_card.face_down = false

    board.display

    if first_card.face == second_card.face
      player.blacklist << move.first
      player.blacklist << move.last
      puts "They match!"
    else
      puts "They don't match!"
      first_card.face_down = true
      second_card.face_down = true
    end
  end

  def winner

  end

  def game_over?
    board.board.all? { |el| el.first.face_down == false }
  end
end

if __FILE__ == $PROGRAM_NAME
  new_game = Game.new
  new_game.play
end
