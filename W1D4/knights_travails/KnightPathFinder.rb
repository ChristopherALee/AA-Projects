require_relative "../poly_tree_node/skeleton/lib/00_tree_node.rb"
require 'byebug'

class KnightPathFinder
  attr_reader :start_pos, :move_tree, :visited_positions
  
  DIRS = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[-1,2],[1,-2],[-1,-2]]
  def initialize(start_pos = [0,0])
    # debugger
    @start_pos = start_pos
    @visited_positions = [start_pos]
    @move_tree = build_move_tree
  end
  
  def build_move_tree
    moves = PolyTreeNode.new(@start_pos)
    queue = [moves]
    
    until queue.empty?
      current_pos = queue.shift
      next_pos = new_move_postions(current_pos.value)
      
      next_pos.map! do |pos| 
        child = PolyTreeNode.new(pos)
        child.parent = current_pos
        child
      end
      
      queue += next_pos
    end
    
    moves
  end
  
  def new_move_postions(pos)
    # debugger
    possible_moves = KnightPathFinder.valid_moves(pos)
    new_positions = possible_moves.select { |el| !@visited_positions.include?(el) }
    @visited_positions += new_positions
    new_positions
  end
  
  
  def self.valid_moves(pos)
    possibilities = possible_moves(pos)
    possibilities.select do |coor|
      coor.all? {|el| el.between?(0,7)}
    end
  end
  
  def self.possible_moves(pos)
    DIRS.map do |move|
      y, x = move[0], move[1]
      [pos[0] + y, pos[1] + x]
    end
  end
  
  def find_path(end_pos)
    target = @move_tree.dfs(end_pos)
    path = []
    
    until target.parent.nil?
      path << target.value 
      target = target.parent
    end
    
    path << target.value
    
    render(path.reverse)
    path.reverse
  end
  
  def render(path)
    grid = Array.new(8) { Array.new(8, " ") }
    path.each do |pos|
      grid[pos.first][pos.last] = "X"
    end
    
    puts 
    grid.each do |row|
      puts "-" * 33
      display_row(row)
    end
    
    puts "-" * 33
  end
  
  def display_row(row)
    row.each do |el|
      print "| #{el} "
    end
    
    puts "|"
  end
  
end

if $PROGRAM_NAME == __FILE__
  knight = KnightPathFinder.new
end