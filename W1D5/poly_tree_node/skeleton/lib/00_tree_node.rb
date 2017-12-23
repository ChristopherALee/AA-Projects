class PolyTreeNode
  attr_reader :value, :parent, :children
  
  def initialize(value = nil, parent = nil)
    @value = value
    @parent = parent
    @children = []
  end
  
  def parent=(parent)
    if parent.nil?
      @parent = parent
    else
      @parent.disown(self) unless @parent.nil?
      @parent = parent
      @parent.children << self unless @parent.children.include?(self)
    end
  end
  
  def disown(child)
    @children.select! {|c| c != child}
  end
  
  def add_child(child_node)
    child_node.parent = self
  end
  
  def remove_child(child_node)
    raise "Child doesn't exist" unless @children.include?(child_node)
    child_node.parent = nil
  end
  
  def dfs(target_value)
    return self if target_value == @value
    
    @children.each do |child|
      return_value = child.dfs(target_value)
      return return_value unless return_value.nil?
    end
    return nil
  end
  
  def bfs(target_value)
    queue = [self]
    
    until queue.empty?
      node = queue.shift
      return node if target_value == node.value
      # queue += node.children
      node.children.each { |child| queue << child }
    end
    
    nil
  end
end