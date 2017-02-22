require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail


  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if self.head.nil?
      self.head = node
      self.tail = node
    else
      self.tail.next = node
      self.tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if self.head.nil?
      self.tail = nil
    elsif self.head.next.nil?
      self.tail = nil
    else
      this_node = self.head
      almost_last = nil
      until this_node.next.nil?
        almost_last = this_node
        this_node = this_node.next
      end
      almost_last.next = nil
      self.tail = almost_last
    end
  end

  # This method prints out a representation of the list.
  def print
    output = ""
    this_node = self.head

    until this_node.nil?
      output += this_node.data + "\n"
      this_node = this_node.next
    end
    puts output
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node.data == self.head.data
      remove_front
    elsif node.data == self.tail.data
      remove_tail
    else
      this_node = self.head
      previous_node = nil
      until this_node.data == node.data
        previous_node = this_node
        this_node = this_node.next
      end
      previous_node = this_node.next
      this_node.next = nil
      return this_node
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if self.head.nil?
      self.head = node
      self.tail = node
    else
      intern = self.head
      self.head = node
      self.head.next = intern
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if self.head.nil?
      return nil
    else
      intern = self.head
      self.head = self.head.next
      return intern
    end
  end
end
