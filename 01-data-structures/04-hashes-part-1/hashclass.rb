class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    itemsIndex = index(key, @items.length)
    if @items[itemsIndex].nil?
      @items[itemsIndex] = HashItem.new(key, value)
    elsif @items[itemsIndex].key != key
      self.resize
      self[key] = value
    elsif @items[itemsIndex].key === key && @items[itemsIndex].value != value
      self.resize
      @items[itemsIndex].value = value
    end
  end


  def [](key)
    itemsIndex = index(key, @items.length)
    if !@items[itemsIndex].nil? and @items[itemsIndex].key === key
      return @items[itemsIndex].value
    end
  end

  def resize
    smallArray = @items
    theSize = smallArray.length
    @items = Array.new(theSize * 2)
    smallArray.each do |num|
      unless num.nil?
        if @items[index(num.key, theSize)].nil?
          self[num.key] = num.value
        elsif @items[index(num.key, theSize)].key != key
          self.resize
          self[num.key] = num.value
        elsif @items[index(num.key, theSize)].key === key && @items[index(num.key, theSize)].value != value
          self.resize
          @items[index(num.key, theSize)].value = num.value
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end
end
