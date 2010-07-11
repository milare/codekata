class SinglyLinkedList

  def initialize
    @head = Node.new(nil, nil)
  end

  def find(value)

    if empty_list?
      return nil
    else
      if @head.value == value
        return @head
      else
        current = @head
        while current
          if current.value == value
            return current
          end
          current = current.next_node
        end
      end
    end
  end


  def delete(node)

    if !empty_list? and node
      current = @head
      if current == node
        @head = @head.next_node
      else
        while current.next_node != node
          current = current.next_node
        end
        if current
          current.next_node = current.next_node.next_node
          true
        end
      end
    end
    false
  end


  def values

    nodes = []

    if !empty_list?
      current = @head
      while current
        nodes << current.value
        current = current.next_node
      end
    end
    nodes
  end

  def add(value)

    if empty_list?
      @head.value = value
    else
      current = @head
      while current.next_node
        current = current.next_node
      end
      new_node = Node.new(value, nil)
      current.next_node = new_node
      true
    end
    false
  end

  def empty_list?
    if @head.value
      false
    else
      true
    end
  end

  private
  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node)
      @value = value
      @next_node = next_node
    end

  end

end

