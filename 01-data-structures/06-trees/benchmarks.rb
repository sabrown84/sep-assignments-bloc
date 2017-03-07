require 'benchmark'
require_relative 'binary_tree/binary_search_tree.rb'
require_relative 'min_binary_heap/min_heap.rb'

heap = MinHeap.new

Benchmark.bm do |x|
  x.report("MinHeap: ") do
    for i in (1..10000) do
      node = Node.new("#{i}", i)
      heap.insert(node)
    end
  end
end

root = Node.new("1", 1)
tree = BinarySearchTree.new(root)

Benchmark.bm do |x|
  x.report("BinarySearchTree: ") do
    for i in (2..10000) do
      node = Node.new("#{i}", i)
      tree.insert(root, node)
    end
  end
end
