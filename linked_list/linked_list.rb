class Node
  attr_accessor :next_node, :value

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  # Appends a new node at the end of the list
  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = new_node
    end
  end

  def preprend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  # Prints the entire list
  def size
    current = @head
    counter = 0
    while current
      counter += 1
      current = current.next_node
    end
    counter
  end

  def at(index)
    current = @head
    counter = 0
    while counter < index
      counter += 1
      current = current.next_node
    end
    current
  end

  def find(value)
    current = @head
    counter = 0

    return nil if current.nil?

    while current.value != value

      counter += 1
      current = current.next_node
      break if current.nil?

    end
    return nil if current.nil?

    counter
  end

  def tail
    tail = @head
    tail = tail.next_node while tail.next_node
    tail
  end

  def contains?(value)
    current = @head
    while current
      return true if current.value == value

      current = current.next_node
    end
    false
  end

  def pop
    dummy = @head
    current = dummy
    return nil if @head.nil?
    return @head = nil if @head.next_node.nil?

    while current.next_node
      dummy = current
      current = current.next_node
    end

    dummy.next_node = nil
  end

  def print
    current = @head
    while current
      puts current.value
      current = current.next_node
    end
  end

  def to_s
    current = @head
    string = ''
    while current
      puts current.value
      string += "(#{current.value}) -> "
      current = current.next_node
    end
    string += "nil"
    string
  end
end
