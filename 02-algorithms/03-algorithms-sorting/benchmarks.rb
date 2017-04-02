require 'benchmark'
require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'quick_sort'

array = []
1000.times do
  array << rand(1000)
end

Benchmark.bm do |x|
  x.report { bucketSort(array, 100) }
  x.report { heapSort(array) }
  x.report { quickSort(array) }
end

#The bucket sort is the fastest because it sorts without pre-sorting. The others take more time because of the use of categorical organizing.
