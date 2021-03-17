class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head, :size

  def initialize
    @head = nil
    @size = 0
  end
  
  def append(value)
    if self.head.nil?
      self.head = Node.new(value)
    else
      node = self.head
      node = node.next_node until node.next_node.nil?
      node.next_node = Node.new(value)
    end
    self.size += 1
  end

  def prepend(value)
    if self.head.nil?
      self.head = Node.new(value)
    else
      node = self.head
      self.head = Node.new(value)
      self.head.next_node = node
    end
    self.size += 1
  end

  def get_head
    if self.head.nil?
      nil
    else
      self.head.value
    end
  end

  def get_tail
    if self.head.nil?
      nil
    else
      node = self.head
      node = node.next_node until node.next_node.nil?
      node.value
    end
  end

  def node_at(index)
    if index >= 0 and index <= size
      node = self.head
      index.times do
        node = node.next_node
      end
      node.value
    else
      "out of range"
    end
  end

  def pop
    return nil if self.size < 1
    
    if self.size == 1
      node = self.head
      node = nil
      self.size -= 1
      return node
    end
    node = self.head
    (self.size - 2).times do
      node = node.next_node
    end
    new_node = node.next_node
    new_node.next_node = nil
    self.size -= 1
    return new_node.value
  end

  def contains?(value)
    return false if self.size < 1
    node = self.head
    return true if node.value == value
    while node.next_node
      node = node.next_node
      return true if node.value == value
    end
    false
  end

  def find(value)
    return nil if self.size < 1
    index = 0
    node = self.head
    return index if node.value == value
    while node.next_node
      node = node.next_node
      index += 1
      return index if node.value == value
    end
    nil
  end

  def to_s
    string = ""
    if self.head
      node = self.head
      string = "( #{node.value} ) ->"
      while node.next_node
        node = node.next_node
        string += "( #{node.value} ) ->"
      end
    end
    string += " nil"
  end
end


#Tests
=begin
list = LinkedList.new
list.append("test_append1")
list.append("test_append2")
list.append("test_append3")
puts ">>>>>>>>>>>>>>>>>>>append node value"
p list.head.value
list.prepend("test_prepend1")
puts "p>>>>>>>>>>>>>>>>>>>prepend node value"
p list.head.value
puts ">>>>>>>>>>>>>>>>>>>>>total number of nodes"
p list.size
puts ">>>>>>>>>>>>>>>>>>>>>first node of the list"
p list.get_head
puts ">>>>>>>>>>>>>>>>>>>>>>last node of the list"
p list.get_tail
puts ">>>>>>>>>>>>>>>>>>>>>>>node at the given index"
p list.node_at(2)
puts ">>>>>>>>>>>>>>>>>>>>>>>pop node"
p list.pop
=end
list = LinkedList.new
list.append("append1")
list.append("append2")
p list.get_tail
p list.size
p list.contains?("append1")
p list.find("append2")
p list.to_s