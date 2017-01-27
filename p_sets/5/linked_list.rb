# exercises from https://www.sitepoint.com/ruby-interview-questions-linked-lists-and-hash-tables/
# 1. Print out a linked list given the first node

#### Creating a node class:

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end

  def to_s
    current_node = self
    result = "["
    until current_node.next_node.nil?
      result = result + current_node.value.to_s + ", "
      current_node = current_node.next_node
    end
    result + current_node.value.to_s + "]"
  end
end

#### Creating a node struct:

Node = Struct.new(:value, :next_node) do
  def to_s
    current_node = self
    result = "["
    until current_node.next_node.nil?
      result = result + current_node.value.to_s + ", "
      current_node = current_node.next_node
    end
    result + current_node.value.to_s + "]"
  end
end

head = Node.new(7, nil)
middle = Node.new(8, nil)
tail = Node.new('hello', nil)

head.next_node = middle
middle.next_node = tail
puts head
# puts automatically calls the to_s method.
# It could have been called output and then you would
# have to type puts head.output
