def iterative_binary_searcher(array, item)
  low = 0
  high = array.length - 1

  while low <= high
    mid = (low + high) / 2
    if array[mid] > item
      high = mid - 1
    elsif array[mid] < item
      low = mid + 1
    else
      return puts "Found #{item}"
    end
  end
end
 
