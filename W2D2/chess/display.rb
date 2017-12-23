require 'colorize'
require_relative 'cursor'
require_relative 'board'
require 'byebug'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    alphabet = ("A".."Z").to_a
    puts "  " + "  0   1   2   3   4   5   6   7"
    puts "  " + ("=" * 33)
    board.grid.each_with_index do |row, idx|
      puts "#{alphabet[idx]} #{display_row(row, idx)}"
    end
    puts "  " + ("=" * 33)
  end

  def loop_render
    start_pos = nil
    end_pos = nil

    while true
      system("clear")
      render

      @cursor.get_input
      if @cursor.selected
        start_pos = @cursor.cursor_pos
        debugger
      else
        end_pos = @cursor.cursor_pos
        debugger
        @board.move_piece(start_pos, end_pos)
      end
    end
  end

  def display_row(row, idx)
    create_row = ""

    row.each_with_index do |el, idx2|
      if idx2 == row.length - 1
        if @cursor.cursor_pos == [idx, idx2] && @cursor.selected
          create_row << "|" + " #{el.face} ".colorize(:background => :green) + "|"
        elsif @cursor.cursor_pos == [idx, idx2]
          create_row << "|" + " #{el.face} ".colorize(:background => :red) + "|"
        else
          create_row << "| #{el.face} |"
        end
      else
        if @cursor.cursor_pos == [idx, idx2] && @cursor.selected
          create_row << "|" + " #{el.face} ".colorize(:background => :green)
        elsif @cursor.cursor_pos == [idx, idx2]
          create_row << "|" + " #{el.face} ".colorize(:background => :red)
        else
          create_row << "| #{el.face} "
        end
      end
    end

    create_row
  end

end
