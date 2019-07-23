class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false) # Everything is false at beginning
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true
    true
  end

  def remove(num)
    is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    is_valid?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num >= @store.length || num < 0 || !num.is_a?(Integer)
  end

  def validate!(num)
  end
end


class IntSet  #We default to 20 as set size

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }

  end

  def insert(num)
    index = num % @store.length
    @store[index] << num
    return false if !@store[index].include?(num)
    return true if @store[index].include?(num)
  end

  def remove(num)
    index = num % @store.length
    @store[index].delete(num) 
  end

  def include?(num)
    index = num % @store.length
    @store[index].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    index = num % @store.length
    if !@store[index].include?(num)
      @store[index] << num
      @count += 1
    end 
    resize! if @count > num_buckets
  end

  def remove(num)
    index = num % @store.length
    if @store[index].include?(num)
      @store[index].delete(num)
      @count -= 1
    end 
  end

  def include?(num)
    index = num % @store.length
    @store[index].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = ResizingIntSet.new(num_buckets * 2)
    @store.flatten.each do |num|
      new_store.insert(num)
    end
    @store = new_store.store
  end
end
