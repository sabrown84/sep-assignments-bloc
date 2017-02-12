require_relative 'node'

class OpenAddressing
  def initialize(size)
    @size = size
    @items = Array.new(size)
    @items_increase = 0
  end

  def []=(key, value)
    given_index = index(key, @size)
    new_hash_item = next_open_index(given_index)
    #if new_hash_item.nil?
    #while @items[given_index].value != value
      @items_increase += 1
    #elsif new_hash_item.key != key
      #while @items[given_index].value != value
        #new_hash_item.value = value
        if new_hash_item == -1
          self.resize
          new_hash_item = next_open_index(given_index)
          #self[key] = value
          return
        else
          new_index = next_open_index(index(key, @size))
          @items[new_hash_item] = value
        end
      end


  def [](key)
    item = @items[index(key, @size)]
    @items_increase = 0
    until item == @size
      if item.nil?
        return nil
      elsif @items[item].key === key
        return @items[item].value
      else
        item += 1
        end
      end
    end
  #end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    given_index = index
    while index <= (@size - 1)
      if @items[index].nil?
        return index
      elsif @items[index] != nil && index == (given_index - 1)
        return -1
      elsif @items[index] != nil && @items[index] == (@size -1)
        index = 0
      else
        index += 1
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    smallArray = @items
    new_items = []
    @size = @size * 2
    smallArray = Array.new(@size)
    smallArray.each do |num|
      unless num.nil?
        new_items << item
      end
    end
    final_array = @items
    new_items.each do |num|
      self[num.key] = num.value
    end
  end
end
