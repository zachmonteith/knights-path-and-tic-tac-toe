class PolyTreeNode
  attr_accessor :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def value
    @value
  end

  def parent=(par)
    @parent.children.delete(self) if @parent
    @parent = par
    unless @parent == nil
      @parent.children << self unless @parent.children.include?(self)
    end

  end

  def add_child(kid)
    @children << (kid) unless @children.include?(kid)
    kid.parent = self
  end

  def remove_child(kid)
    if @children.include?(kid)
      @children.delete(kid)
      kid.parent = nil
    else
      raise "not yo baby!"
    end
  end

  def inspect
    @value.inspect
  end

  def dfs(target_value)
    return self if @value == target_value
    return nil if @children.empty?
    kids = @children.dup
    found = nil
    until kids.empty?
      kid = kids.shift
      found = kid.dfs(target_value)
      break if found
    end
    found ? found : nil
  end

  def bfs(target_value)
    return self if self.value == target_value
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      current_node.children.each do |kid|
        return kid if kid.value == target_value
        queue << kid
      end
    end
  end

end
