class Towers_of_Hanoi
  attr_accessor :towers
  def initialize
    @towers = [
      [3,2,1],
      [],
      []
    ]
  end
  
  def move(start, end_t)
    if towers[start].empty? || (!towers[end_t].empty? && towers[start].last > towers[end_t].last)
        raise "Invalid move" 
    end
    towers[end_t] << towers[start].pop
  end
  
  def won?
    return false if !towers.first.empty?
    towers.any?{|tower| tower == [3, 2, 1]}
  end
  
end