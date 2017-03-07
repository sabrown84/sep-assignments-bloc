require_relative "node"

class MinHeap
  attr_accessor :heap

  def initialize
    @heap = Array.new()
  end

  def insert(node)
    @heap << node
    node_index = @heap.size - 1
    unless @heap[0] == @heap[node_index]
      bubble_up(node_index)
    end
    left_right
  end

  def delete
    @heap.shift
    left_right
  end

  def find
    return @heap[0]
  end

  def print
    temp = [@heap[0]]
    returned_string = ""

    until temp.empty?
      new_root = temp.shift
      new_root_index = @heap.find_index(new_root)
      left_node = 2 * new_root_index + 1
      right_node = 2 * new_root_index + 2
      unless @heap[left_node] == nil
        temp << @heap[left_node]
      end
      unless @heap[right_node] == nil
        temp << @heap[right_node]
      end
      returned_string << "#{new_root.title}: #{new_root.rating}\n"
    end
    puts returned_string
  end

  def bubble_up(index)
    parent_index = parent(index)

    if @heap[index].rating > @heap[parent_index].rating
      return
    elsif @heap[index].rating < @heap[parent_index].rating
      temp = @heap[parent_index]
      @heap[parent_index] = @heap[index]
      @heap[index] = temp
      self.bubble_up(parent_index)
    end
  end

  def left_right
    @heap.each_with_index do |x, index|
      left_child = old_left_child(index)
      right_child = old_right_child(index)
      unless @heap[left_child] == nil
        @heap[index].left = @heap[left_child]
      end

      unless @heap[right_child] == nil
        @heap[index].right = @heap[left_child]
      end
    end
  end

  def parent(index)
    return (index / 2).floor
  end

  def old_left_child(index)
    return ((index * 2) + 1).floor
  end

  def old_right_child(index)
    return ((index * 2) + 2).floor
  end
end
