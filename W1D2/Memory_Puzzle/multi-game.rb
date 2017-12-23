require_relative 'Card'
require_relative 'Board'
require_relative 'Player'
require_relative 'Computer'

class Game
  attr_reader :player1, :player2
  attr_accessor :board, :blacklist, :current_player, :other_player

  def initialize
    @board = Board.new
    @player1 = Player.new("Human")
    @player2 = ComputerPlayer.new("Computer")
    @current_player = player1
    @other_player = player2
  end

  def play
    until game_over?
      board.display
      puts "#{current_player.name}'s' turn!"
      play_turn
      switch_players
    end

    puts winner
  end

  def play_turn
    move = @current_player.get_move
    p move
    first_card = board[move.first].first
    second_card = board[move.last].first

    first_card.face_down = false
    second_card.face_down = false

    board.display

    if first_card.face == second_card.face
      @current_player.known_cards[move.first] = first_card.face
      @current_player.known_cards[move.last] = second_card.face
      @other_player.update_cpu_blacklist([move.first, first_card.face], [move.last, second_card.face])
      puts "They match!"
    else
      puts "They don't match!"
      first_card.face_down = true
      second_card.face_down = true
      @other_player.update_cpu_blacklist([move.first, first_card.face], [move.last, second_card.face])
    end
  end

  def switch_players
    if @current_player == player1
      @current_player = player2
      @other_player = player1
    else
      @current_player = player1
      @other_player = player2
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
