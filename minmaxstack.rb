class MinMaxStack
  attr_reader :store

  def initialize
    @store = []
  end

  def max
    @store.empty? ? nil : @store[-1][2]
  end

  def min
    @store.empty? ? nil : @store[-1][1]
  end

  def push el
    @max = el if empty? || el > @max
    @min = el if empty? || el < @min

    if @store.empty?
      @store << [el, el, el]
    else
      @store << [el, @min, @max]
    end

    el
  end

  def pop
    el = @store.pop
    if empty?
      @min, @max = nil, nil
    else
      _, @min, @max = @store.last
    end

    el
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end
