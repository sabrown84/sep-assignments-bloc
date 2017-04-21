# This method takes n arrays as input and combine them in sorted ascending  order
def differently_written_ruby(*arrays)
  combined_array = arrays.map { |array| array }
  combined_array.flatten!
    sorted_array = [combined_array.pop]
    length = sorted_array.length

  for val in combined_array
    i = 0
    while i < length
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == length - 1
        sorted_array.insert(i, val)
        break
      end
      i+=1
    end
  end

  # Return the sorted array
  sorted_array
end
