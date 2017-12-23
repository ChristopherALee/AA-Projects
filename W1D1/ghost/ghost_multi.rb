require_relative 'player'

class Game
  attr_reader :dictionary, :current_player, :players, :fragment, :losses

  def initialize(*players, dictionary = File.readlines("./dictionary.txt").map(&:chomp))
    @fragment = ""
    @players = players
    @current_player = players[0]
    @dictionary = dictionary
    @losses = {}
    losses_hash(players)
  end

  def losses_hash(players)
    players.each do |player|
      losses[player.name] = 0
    end
  end

  def game_over?
    return true if dictionary.include?(fragment)
    false
  end

  def switch_players
    current_player == player1 ? @current_player = player2 : @current_player = player1
  end

  def play_turn
    p "Fragment: #{fragment}"
    guess = current_player.guess

    until valid_play?(fragment + guess)
      p fragment
      p "No words start with this, try again."
      guess = current_player.guess
    end

    fragment << guess
  end

  def valid_play?(post_frag)
    dictionary.any? { |word| word.start_with?(post_frag) }
  end

  def game_loser
    p "#{current_player.name} lost!"
  end

  def game_winner
    winner = losses.select { |key, value| value < 5 }.first.first

  end

  def play_round
    until game_over?
      play_turn
      switch_players
    end

    switch_players
    p fragment
    game_loser
  end

  def record(player)
    count = @losses[player.name]
    count > 0 ? "GHOST"[0...count] : ""
  end

  def update_losses
    @losses[current_player.name] += 1
  end

  def run
    until losses.any? { |key, value| value == 5 }
      play_round
      update_losses
      display_standings
      @fragment = ""
    end

    p "#{game_winner} wins!"
  end

  def display_standings
    puts "#{player1.name}: #{record(player1)}"
    puts "#{player2.name}: #{record(player2)}"
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "Welcome to Ghost Game"
  puts "How many players?"
  player_count = gets.chomp
  player_count.times do |idx|
    puts "Player #{idx+1} name?"
    print "> "
  end
  
  puts "Player 1 name?"
  print "> "
  name1 = gets.chomp.capitalize
  puts "Player 2 name?"
  print "> "
  name2 = gets.chomp.capitalize

  player1 = Player.new(name1)
  player2 = Player.new(name2)

  new_game = Game.new(player1, player2)
  new_game.run
end
