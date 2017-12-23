require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    alphabet = ("A".."Z").to_a
    puts "   " + " 0   1   2   3   4   5   6   7"
    puts "   " + ("=" * 31)
    board.grid.each_with_index do |row, idx|
      puts "#{alphabet[idx]} #{display_row(row, idx)}"
    end
    puts "   " + ("=" * 31)
  end

  def loop_render
    while true
      system("clear")
      render
      @cursor.get_input
    end
  end

  def display_row(row, idx)
    create_row = ""

    row.each_with_index do |el, idx2|
      if idx2 == row.length - 1
        if @cursor.cursor_pos == [idx, idx2]
          create_row << "|" + " a ".colorize(:background => :red) + "|"
          # create_row << "| a |".colorize(:background => :red)
        else
          create_row << "| a |"
        end
      else
        if @cursor.cursor_pos == [idx, idx2]
          create_row << "|" + " a ".colorize(:background => :red)
          # create_row << "| a ".colorize(:background => :red)
        else
          create_row << "| a "
        end
      end
    end

    create_row
  end

end
