require_relative 'minmaxstack'
require_relative 'queue'

class MinMaxStackQueue
  def initialize
    @store1 = MinMaxStack.new
    @store2 = MinMaxStack.new
  end

  def enqueue el
    @store1.push el
  end

  def dequeue
    @store1.size.times{ @store2.push(@store1.pop[0]) }
    @store2.pop
    @store2.size.times{ @store1.push(@store2.pop[0]) }
  end

  def peek
    @store1.size.times{ @store2.push(@store1.pop[0]) }
    @store2.peek[0]
    @store2.size.times{ @store1.push(@store2.pop[0]) }
  end

  def max
    @store1.max
  end

  def min
    @store1.min
  end

  def size
    @store1.size
  end

  def empty?
    @store1.empty?
  end
end
