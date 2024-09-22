module Enumerable
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for elem in self do
      yield(elem)
    end
    self
  end

  def my_each_with_index
    index = 0
    for elem in self do
      yield(elem, index)
      index +=1
    end
    self
  end

  def my_select
    find = []
    each do |elem|
      find.push(elem) if yield(elem)
    end
    find
  end

  def my_all?
    match = true
    each do |elem|
      return false unless yield(elem)
    end
    match
  end

  def my_any?
    match = false
    each do |elem|
      return true if yield(elem)
    end
    match
  end

  def my_none?
    match = true
    each do |elem|
      return false if yield(elem)
    end
    match
  end

  def my_count
    return length unless block_given?

    count = 0
    each do |elem|
      count += 1 if yield(elem)
    end
    count
  end

  def my_map
    return self unless block_given?

    transformed_array = []
    each do |elem|
      transformed_array << yield(elem)
    end
    transformed_array
  end

  def my_inject(initial_value)
    acummulator = initial_value
    each_with_index do |elem, index|
      next if initial_value.nil? && index.zero? # Skip first element if no initial value

      acummulator = yield(acummulator, elem) # Apply block to accumulate result
    end
    acummulator
  end
end
