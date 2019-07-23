class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
     index = key.hash % @store.length
    if !@store[index].include?(key)
      @store[index] << key
      @count += 1
      resize! if @count > num_buckets
    end 
    
  end

  def include?(key)
    index = key.hash % @store.length
    @store[index].include?(key)
  end
  

  def remove(key)
      index = key.hash % @store.length
    if @store[index].include?(key)
      @store[index].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end

  def resize!
    new_store = ResizingIntSet.new(num_buckets * 2)
    @store.flatten.each do |num|
      new_store.insert(num)
    end
    @store = new_store.store
  end
end




# class ResizingIntSet
#   attr_reader :count, :store

#   def initialize(num_buckets = 20)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end

#   def insert(num)
#     index = num % @store.length
#     if !@store[index].include?(num)
#       @store[index] << num
#       @count += 1
#     end 
#     resize! if @count > num_buckets
#   end

#   def remove(num)
#   
#     end 
#   end

#   def include?(num)
#     

#   private

#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#   end

#   def num_buckets
#     @store.length
#   end

#   
# end
