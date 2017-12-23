class Array
  
  
  def two_sum
    subsets = []
    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        subsets << [i, j] if self[i] + self[j] == 0 && !subsets.include?([j, i])
        j += 1
      end
      i += 1
    end
    subsets
  end
end