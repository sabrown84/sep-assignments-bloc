require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    given_index = index(key, @items.length)
    new_hash_item = @items[given_index]
    if new_hash_item.nil?
      @items[given_index] = Node.new(key, value)
    elsif new_hash_item.key != key
      while @items[index(key, @items.length)].key != nil && @items[index(key, @items.length)].key != key
        resize
        new_index = index(key, @items.length)
        break if @items[new_index] == nil
      end
      self[key] = value
    elsif new_hash_item.key == key && new_hash_item.value != value
      if next_open_index(given_index) == -1
        resize
        new_index = index(key, @items.length)
        #@items[new_index].value = value
      else
        next_index = next_open_index(index(key, @items.length))
        @items[next_index] = value
      end
    end
  end

  def [](key)
    item = @items[index(key, @items.length)]
    if item.nil? then nil else item.value end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    given_index = index
    while index <= (@items.length - 1)
      if @items[index] == nil
        return index
      elsif @items[index] != nil && index == (given_index - 1)
        return -1
      elsif @items[index] != nil && @items[index] == (@items.length - 1)
        index = 0
      else
        index += 1
      end
    end
    -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    smallArray = @items
    theSize = smallArray.length
    larger_hash = Array.new(theSize * 2)
    @items.each do |num|
      if num != nil
        larger_hash[index(num.key, theSize)] = num
      end
    end
    @items = larger_hash
  end
end
