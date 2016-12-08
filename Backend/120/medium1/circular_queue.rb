class CircularQueue
  def initialize(size)
    @buffer = [nil] * size
    @oldest = nil
    @count = 0
  end

  def delete_at(value)
    testing_var = @buffer.index(value)
    @buffer[@buffer.index(value)] = nil
    testing_var

  end

  def dequeue
    value = @buffer[@oldest]
    @buffer[@oldest] = nil
    @oldest = value + 1
    value
  end

  def enqueue(num)
    @oldest = @oldest + 1 unless @buffer.include?(nil)

    @buffer[count] = num
    
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil