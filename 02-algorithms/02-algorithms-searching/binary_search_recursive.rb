def recursive_binary_searcher(array, item, low = 0, high = 0)
  if high == nil
    high = array.length - 1
  end

  mid = (low + high)/ 2

  if array[mid] == item
    return mid
  elsif array[mid] < value
    recursive_binary_searcher(array, item, (mid + 1), high)
  else
    recursive_binary_searcher(array, item, low, (mid - 1))
  end
end
      
