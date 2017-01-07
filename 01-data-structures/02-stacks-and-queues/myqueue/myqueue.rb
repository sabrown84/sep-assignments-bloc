class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[0]
  end

  def enqueue(element)
    @queue[@queue.length] = element
    refresh
    @tail
  end

  def dequeue
    result = @queue.shift
    refresh
    result
  end

  def empty?
    @queue.length < 1
  end

  def refresh
    @head = @queue[-1]
    @tail = @queue[0]
  end
  private :refresh
end