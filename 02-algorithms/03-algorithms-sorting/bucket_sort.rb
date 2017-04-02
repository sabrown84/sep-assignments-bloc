def bucketSort(array, b)
  buckets = []
  b.times do
    buckets << []
  end

  min_value = array.min
  max_value = array.max
  width = ( (max_value - min_value) / b.to_f).ceil
  for item in array do
    if item == min_value
      bucket_number = 0
    elsif item == max_value
      bucket_number = -1
    else
      bucket_number = ( (item / width.to_f) - ((min_value + 1) / width.to_f) ).floor
    end
    buckets[bucket_number].push(item)
  end

  array.clear
  for bucket in buckets do
    bucket = insertionSort(bucket)
    for item in bucket do
      array.push(item)
    end
  end
  return array
end

def insertionSort(collection)
  sorted_collection = [collection.delete_at(0)]
  for value in collection
    sorted_collection_index = 0
    while sorted_collection_index < sorted_collection.length
      if value <= sorted_collection[sorted_collection_index]
        sorted_collection.insert(sorted_collection_index, value)
        break
      elsif sorted_collection_index == sorted_collection.length - 1
        sorted_collection.insert(sorted_collection_index + 1, value)
        break
      end
      sorted_collection_index += 1
    end
  end
  return sorted_collection
end
