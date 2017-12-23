class Array
  def my_transpose
    result = Array.new(self.length) { [] }
    
    self.each_index do |idx|
      self.each_index do |idx2|
        result[idx][idx2] = self[idx2][idx]
      end
    end
    
    result
  end
end