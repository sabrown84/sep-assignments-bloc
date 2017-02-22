require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @item_count = 0
    @max_load_factor = 0.7
  end

  def []=(key, value)
    index = index(key, @items.size)
    n = Node.new(key, value)

    # COLLISION!
    if @items[index] != nil
      list = @items[index]
    else
      list = LinkedList.new
    end
      list.add_to_tail(n)
      @items[index] = list
      @item_count = @item_count + 1

    # Resize the hash if the load factor grows too large
    if load_factor.to_f > max_load_factor.to_f
      resize
    end
  end

  def [](key)
    list = @items.at(index(key, @items.size))
    if list != nil
      current = list.head
      while current != nil
        if current.key == key
          return current.value
        end
        current = current.next
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @item_count / self.size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    new_size = size * 2
    new_items = Array.new(new_size)
    (0..@items.size-1).each do |i|
      list = @items[i]
      if list != nil
        current = list.head
        # We only need to compute the new index once
        new_index = index(current.key, new_items.size)
        while current != nil
          list = LinkedList.new
          list.add_to_tail(current)
          new_items[new_index] = list
          current = current.next
        end
      end
    end
    @items = new_items
  end

def print
  hasg_load_factor = @item_count / self.size.to_f
  puts "Hash load factor is #{hash_load_factor}"
  @items.inspect
end

end
