class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    num = 0
    (self.join.to_i + self.length).hash
  end
end

class String
  def hash
    self.split('').map{|letter| letter.ord}.join('').to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  
  def hash
    hash_array = []
    self.each do |key, value|
      hash_array << key.hash 
    end 
    hash_array.sort.hash
  end
end
