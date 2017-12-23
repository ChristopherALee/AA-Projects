class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    key 
  end
end

class LinkedList
  
  attr_accessor :list 
  
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head  
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return nil if empty?
    @head.next
  end

  def last
    return nil if empty?
    @tail.prev
  end

  def empty?
    @head.next == @tail 
  end

  def get(key)
    self.each do |node|
      if node.key == key
        return node.val
      end
    end
    nil
  end

  def include?(key)
    self.each do |node|
      if node.key == key 
        return true 
      end 
    end 
      false
  end

  def append(key, val)
    prev_node = @tail.prev
    next_node = @tail 
    
    # making new node
    new_node = Node.new(key, val)
    
    # setting existing node next/prev
    prev_node.next = new_node 
    next_node.prev = new_node
    
    # setting new_node next/prev
    new_node.prev = prev_node 
    new_node.next = next_node  
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val
      end
    end
    
    # @list.each do |node|
    #   if node.key == key
    #     node.val = val
    #   end
    # end
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        prev_node = node.prev
        next_node = node.next
        
        prev_node.next = next_node
        next_node.prev = prev_node
      end
    end  
  end

  def each(&prc)
    node = @head.next
    
    until node == @tail
       prc.call(node)
       node = node.next
    end 
    
    
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
