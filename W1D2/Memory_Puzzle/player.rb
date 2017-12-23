require_relative 'Game'

class Player
  attr_reader :name
  attr_accessor :known_cards

  def initialize(name)
    @name = name
    @known_cards = {}
    (0..9).each {|num| known_cards[num] = []}
  end

  def get_move
    p "Which cards do you want to flip? (x,y)"
    move = gets.chomp.split(",").map(&:to_i)

    until valid_move?(move)
      p "Invalid move, try again."
      move = gets.chomp.split(",").map(&:to_i)
    end

    move
  end

  def valid_move?(move)
    if move.all? { |el| (0..9).include?(el) } && move.first != move.last
      if known_cards.count { |key, value| value == known_cards[move.first] }.even?
        return false
      else
        return true
      end
    else
      return false
    end
    # return true if move.all? { |el| (0..9).include?(el) }
    # false
  end

  def update_cpu_blacklist(move1, move2)
  end
end
