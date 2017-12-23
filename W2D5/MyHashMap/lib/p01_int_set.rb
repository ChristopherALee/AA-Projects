require 'byebug'

class MaxIntSet
  attr_reader :max
  attr_accessor :store
  
  def initialize(max)
    @max = max
    @store = Array.new(max) { false }
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    if is_valid?(num)
      @store[num] = false
    end
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num <= max && num >= 0
  end

  def validate!(num)
  end
end


class IntSet
  
  attr_accessor :store
  
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    index = (num % num_buckets)
    @store[index]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if count == num_buckets
    
    unless self.include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets
    @store[index]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@store.length * 2) { Array.new }
    
    @store.each do |bucket|
      next if bucket.empty?
      bucket.each do |num|
        index = num % new_store.length
        new_store[index] << num
      end
    end
    
    @store = new_store
    
    # @store += Array.new(@store.length) { Array.new }
    # @store.each do |bucket|
    #   next if bucket.empty?
    #   new_bucket = self[bucket.first]
    #   self[new_bucket] += bucket
    # end 
  end
end
