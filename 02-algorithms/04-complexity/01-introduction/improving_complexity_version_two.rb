#This method takes n arrays as input and combine them in sorted ascending order.
def better_time_written_ruby(*arrays)
  combined_array = arrays.map { |array| array }
  sorted_array = combined_array.flatten!
  sorted_array.sort!
end
