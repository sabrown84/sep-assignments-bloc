#This method takes n arrays as input and combine them in sorted ascending order.
def best_space_saving_written_ruby(*arrays)
  combined_array = arrays.map { |array| array }
  return combined_array.flatten!.sort!
end
