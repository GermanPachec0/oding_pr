class Node
  attr_accessor :left, :right, :value

  def initialize(value, left = nil, right = nil)
    @left = left
    @right = right
    @value = value
  end
end

class Tree
  def initialize(array = [])
    @root = nil
    @element = array
  end

  def build_tree(elements = [], start, fin)
    return nil if start > fin

    mid = (start + fin) / 2
    root = Node.new(elements[mid])
    root.left = build_tree(elements, start, mid - 1)
    root.right = build_tree(elements, mid + 1, fin)

    @root = root
    @root
  end

  def insert(value)
    current = @root
    while !current.left.nil? && !current.right.nil?
      current = if current.value > value
                  current.left
                else
                  current.right
                end
    end

    new_node = Node.new(value)
    if current.value > value
      current.left = new_node
    else
      current.right = new_node
    end
    @root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

# Example usage:
tree = Tree.new
root = tree.build_tree([1, 2, 3, 4, 5, 6, 7], 0, 6)

tree.insert(3)
tree.pretty_print(root)
