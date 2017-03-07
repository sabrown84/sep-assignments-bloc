require_relative 'node'

class BinarySearchTree
  attr_reader :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating < node.rating
      if root.right == nil
        root.right = node
      elsif root.right != nil
        root = root.right
        self.insert(root, node)
      end
    elsif root.rating > node.rating
      if root.left == nil
        root.left = node
      elsif root.left != nil
        root = root.left
        self.insert(root, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if data == nil || root == nil
      return nil
    end
      limb = root

    if limb.title == data
      return limb
    else
      root = find_new_leaf(root, limb)
      self.find(root, data)
    end
  end

  def delete(root, data)
    if root == nil || data == nil
      return nil
    end

    new_leaf = find(root,data)
    new_leaf.title = nil
    new_leaf.rating = nil

  end

  # Recursive Breadth First Search
  def printf(children = nil)
    order = [@root]
    outcome = ""

    until order.empty?
      potential_root = order.shift
      unless potential_root.left == nil
        order << potential_root.left
      end
      unless potential_root.right == nil
        order << potential_root.right
      end
      outcome << "#{potential_root.title}: #{potential_root.rating}\n"
    end
    puts outcome
  end
  def find_new_leaf(root, limb)
    if limb.right != nil
      return limb.right
    elsif limb.right == nil
      return root.left
    elsif root.left == nil
      return nil
    end
  end
end
