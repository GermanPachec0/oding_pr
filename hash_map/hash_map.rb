class Node
  attr_accessor :next_node, :value, :key

  def initialize(key = nil, value = nil, node = nil)
    @key = key
    @value = value
    @next_node = node
  end
end

class HashMap
  attr_accessor :count, :size, :load_factor, :bucket

  def initialize
    @count = 0
    @load_factor = 0.75
    @size = 16
    @bucket = Array.new(16)
  end

  def hash(key)
    hash_code = 0
    prime_number = 0
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    index = hash_code % @size
    raise IndexError if index.negative? || index >= @size

    index
  end

  def set(key, value)
    hash = self.hash(key)
    node = Node.new(key, value)
    if @bucket.at(hash).nil?
      @bucket[hash] = node
      @count += 1
      @bucket = should_exapand?
      return @bucket
    end

    last_node = append(@bucket[hash], key, value)
    unless last_node.nil?
      @count += 1
      last_node.next_node = node
    end
    @bucket = should_exapand?
    @bucket
  end

  def get(key)
    index = hash(key)
    node = @bucket[index]
    return nil if node.nil?

    while node
      return node.value if node.key == key

      node = node.next_node
    end
    nil
  end

  def keys
    keys = []

    @bucket.each do |current|
      while current
        keys << current.key
        current = current.next_node
      end
    end
    keys
  end

  def values
    values = []
    @bucket.each do |current|
      while current
        values << current.value
        current = current.next_node
      end
    end
    values
  end

  def entries
    values = []
    @bucket.each do |current|
      while current
        values << [current.key,current.value]
        current = current.next_node
      end
    end
    values
  end

  def length
    count = 0

    @bucket.each do |current|
      while current
        count += 1
        current = current.next_node
      end
    end
    count
  end

  def clear
    @bucket = Array.new(16)
  end

  def remove(key)
    index = hash(key)
    current = @bucket[index]
    node_after = current.next_node
    return nil if current.nil?

    if current.key == key
      @bucket[index] = nil
      return current.key
    end

    while node_after
      if node_after.key == key
        new_node = node_after.next_node
        current.next_node = new_node
        return node_after.key
      end
      current = current.next_node
      node_after = node_after.next_node
    end
    nil
  end

  def has?(key)
    index = hash(key)
    node = @bucket[index]
    return false if node.nil?

    while node
      return true if node.key == key

      node = node.next_node
    end
    false
  end

  def should_exapand?
    return @bucket if (@count.to_f / @size.to_f) <= @load_factor.to_f

    @size *= 2
    new_bucket = Array.new(@size)
    @bucket.each do |current|
      next if current.nil?

      while current
        new_index = hash(current.key)
        new_node = Node.new(current.key, current.value, new_bucket[new_index])
        new_bucket[new_index] = new_node
        current = current.next_node
      end
    end
    new_bucket
  end

  def append(head, key, value)
    current_node = head
    while current_node
      if current_node.key == key
        current_node.value = value
        return nil
      end
      return current_node if current_node.next_node.nil?

      current_node = current_node.next_node
    end
  end
end
