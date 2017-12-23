require_relative "Card"
require 'byebug'

class Board
  STATUS = {
    "A" => "_",
    "B" => "_",
    "C" => "_",
    "D" => "_",
    "E" => "_"
  }

  def default_board
    board = Array.new(10) {[]}
    board.map.with_index do |el,i|
       if i <= 4
         el = [Card.new(STATUS.keys[i])]
       else
         el = [Card.new(STATUS.keys[i%5])]
      end
    end
  end

  attr_accessor :board

  def initialize(board = default_board)
    @board = board.shuffle!
  end

  def [](pos)
    board[pos]
  end

  def []=(pos, value)
    board[pos] = value
  end

  def display
    board.each_with_index do |card, idx|
      card.first.face_down == true ? print("_ ") : print("#{card.first.face}")
      # print "#{STATUS[card.first.face]}" if idx == board.length - 1
      # print "#{STATUS[card.first.face]} "
    end
    puts ""
  end
end
