require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @items_increase = 0
  end

  def []=(key, value)
    given_index = index(key, @items.length)
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
          @items[new_hash_item] = Node.new(key, value)
        end
      end
    #end
        #new_index = index(key, @items.length)
        #break if @items[new_index] == nil
    #elsif new_hash_item.key == key && new_hash_item.value != value
    #else new_index = self.next_open_index(given_index)
      #  if new_index == -1
        #  self.resize
        #  self[key] = value
        #  @items_increase += 1
      #  elsif @items[new_index].nil?
        #  @items[new_index] = Node.new(key, value)
        #  @items_increase += 1
      #  elsif @items[new_index].key == key && @items[new_index].value != value
      #    @items[new_index].value = value
      #else
      #  next_index = next_open_index(index(key, @items.length))
      #  @items[next_index] = value
      #end
    #end

  def [](key)
    item = index(key, @items.length)
    @items_increase = 0
    #until item == @items.length
      if @items[item].nil?
        return nil
      elsif @items[item].key == key
        return @items[item].value
      else
        if item == @items.length - 1
          @items_increase = 0
        else
          @items_increase = item + 1
        end
        while @items_increase != item
          if @items[@items_increase] == nil
            return nil
          elsif @items[@items_increase].key == key
            return @items[@items_increase].value
          else
            if @items_increase == @items.length - 1
              @items_increase = 0
            else
              @items_increase += 1
            end
          end
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
    #given_index = index
    until index == @items.length
      if @items[index].nil?
        return index
      #elsif @items[index] != nil && @items[index] == (@items.length - 1)
      #  index = 0
      else
        index += 1
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    smallArray = @items
    theSize = smallArray.length
    new_items = []
    smallArray = Array.new(theSize * 2)
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
