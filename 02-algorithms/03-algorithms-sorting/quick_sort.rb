def quickSort(array)
 #moves the item to the right of pivot
  def itemToRight(array, count, pivot_index)
    temp = array[count]
    array.insert(pivot_index + 1, temp)
    array.delete_at(count)
    return array
  end

  pivot_index = array.length - 1
  pivot_item = array[pivot_index]
  final_index = array.length - 1
  count = 0
  while true
    if count < pivot_index
      if array[count] > pivot_item
        array = itemToRight(array, count, pivot_index)
        pivot_index -= 1
      else
        count += 1
      end
      #reached the pivot
    else
      left = (pivot_index != 0) ? quickSort(array[0...pivot_index]) : []
      right = (pivot_index != final_index) ? quickSort(array[(pivot_index + 1)..final_index]) : []
      return left + [pivot_item] + right
    end
  end
end
