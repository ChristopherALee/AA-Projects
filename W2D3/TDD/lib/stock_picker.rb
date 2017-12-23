class Array
  
  def stock_picker
    raise 'This is less than two dates!' unless self.length > 1
    start_val, end_val = 0, 0
    diff = 0
    subsets = []
    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        subsets << [i, j]
        j += 1
      end
      i += 1
    end 
    
    subsets.sort_by { |date| self[date.last] - self[date.first] }.last
  end

end