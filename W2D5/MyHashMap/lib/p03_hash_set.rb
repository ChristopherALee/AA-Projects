require_relative 'p02_hashing'
require_relative 'p01_int_set'

class HashSet < ResizingIntSet

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = (num.hash % num_buckets)
    @store[index]
  end

  
end
