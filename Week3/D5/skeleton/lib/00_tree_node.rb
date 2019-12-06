require "byebug"
class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    #Write a #parent= method which (1) sets the parent property and 
    #(2) adds the node to their parent's array of children (unless we're setting parent to nil).

    def parent=(new_parent)
        #Reset old parent
        @parent.children.delete(self) if @parent != nil

        if new_parent != nil && !new_parent.children.include?(self)
            new_parent.children << self
        end
        @parent = new_parent
    end

    def add_child(child)
        child.parent = self 
    end

    def remove_child(child) 
        raise "Exception" if child.parent == nil 
        child.parent = nil
    end

    def dfs(target)
        return self if target == self.value 
        @children.each do |child|
            result = child.dfs(target) 
            if result != nil
                return result
            end
        end
        nil
    end

    def bfs(target)
        queue = [self]
        while(!queue.empty?)
            # Remove the first node from the queue,
            head = queue.shift()
            # Check its value,
            return head if head.value == target

            # Push the node's children to the end of the array.
            head.children.each do |child|
                queue << child
            end
        end
        return nil
    end
    

    # def parent2=(new_parent)
    #     #Reset old parent
    #     @parent.children.delete(self) if @parent != nil

    #     original_parent = @parent
    #     @parent = new_parent
    #     if @parent != nil && !@parent.children.include?(self)
    #         @parent.children << self
    #     end
    # end
end