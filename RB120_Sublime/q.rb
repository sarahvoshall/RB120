# class CircularQueue
#   attr_accessor :current_next_position, :current_last_position

#   def initialize(size)
#     @queue = Array.new(size)
#     @current_next_position = 0
#     @current_last_position = 0
#   end

#   def enqueue(object)
#     @queue[current_next_position] = object

#     determine_position(current_next_position)
#   end

#   def dequeue
#     @queue[current_last_position] = nil

#     determine(current_last_position)
#   end

#   private 

#   def determine(position)
#     if position == @queue.size - 1
#       position = 0
#     else 
#       position += 1
#     end
#   end
# end

class CircularQueue
  def initialize(size)
    @queue = []
    @size = size
  end

  def enqueue(object)
    dequeue if full?
    @queue << object
  end

  def dequeue
    @queue.shift
  end

  private 

  def full?
    @queue.size == @size
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