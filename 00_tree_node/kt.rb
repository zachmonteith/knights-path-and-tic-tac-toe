require_relative '00_tree_node.rb'

class KnightPathFinder
  attr_reader :move_tree
  def initialize(pos)
    @pos = pos
    @visited_positions = [pos]
    @move_tree = build_move_tree
  end

  def build_move_tree
    tree = []
    tree << root = PolyTreeNode.new(@pos)
    until @visited_positions.size == 64
      tree.each do |node|
        nextgen = children_of(node)
        nextgen.each do |child|
          node.add_child(child)
        end
        tree += nextgen
      end
    end
    tree
  end

  def children_of(node)
    new_move_positions(node.value).map do |new_pos|
      PolyTreeNode.new(new_pos)
    end
  end


  def valid_moves(pos)
    delta = [[1, 2], [2, 1], [-2, -1], [-2, 1],
             [1, -2], [2, -1], [-1, -2], [-1, 2]]

    delta.select do |move|
      newpos = [(move[0] + pos[0]), (move[1] + pos[1])]
      (((0..7).include?(newpos[0])) && ((0..7).include?(newpos[1])))
    end
  end

  def new_move_positions(pos)
    new_positions = []
    valid_moves(pos).each do |move|
      current_move = [(move[0] + pos[0]), (move[1] + pos[1])]
      unless @visited_positions.include? (current_move)
        new_positions << current_move
      end
    end
    @visited_positions += new_positions
    new_positions
  end

  def find_path(end_pos)
    trace_path_back((@move_tree.select {|node| node.value == end_pos}).first)
  end

  def trace_path_back(node)
    return [node.value] if node.parent.nil?
    trace_path_back(node.parent) + [node.value]
  end

end

test = KnightPathFinder.new([0,0])
p test.find_path([7,6])
p test.find_path([6,2])
