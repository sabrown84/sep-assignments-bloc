class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.unshift(item)
    refresh
  end

  def pop
    result = @stack.shift
    refresh
    result
  end

  def empty?
    @stack.length < 1
  end

  def refresh
    self.top = @stack[0]
  end
  private :refresh 
end