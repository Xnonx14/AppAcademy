require_relative "00_tree_node.rb"
require "byebug"

class KnightPathFinder
    def initialize(start)
        @root_node = PolyTreeNode.new(start)
        @considered_positions = [start]
        build_move_tree()
    end

    def trace_path_back(node)
        arr = []
        while (node != nil)
            arr << node
            node = node.parent 
        end
        arr
    end

    def find_path(dest)
        node = @root_node.bfs(dest)
        arr = trace_path_back(node).map {|ele| ele.value}
        return arr.reverse
    end

    #expects position array such as [0,0]
    #returns array of positions [[],[],[],[]] 
    def self.valid_moves(pos)
        range = (0...8)
        x = pos[0]
        y = pos[1]
        result = []
        result << [x+1,y+2] if range.include?(x + 1) && range.include?(y+2)   
        result << [x+1,y-2] if range.include?(x + 1) && range.include?(y-2)   
        result << [x+2,y+1] if range.include?(x + 2) && range.include?(y+1)   
        result << [x+2,y-1] if range.include?(x + 2) && range.include?(y-1)   
        result << [x-1,y+2] if range.include?(x - 1) && range.include?(y+2)  
        result << [x-1,y-2] if range.include?(x - 1) && range.include?(y-2)   
        result << [x-2,y+1] if range.include?(x - 2) && range.include?(y+1)   
        result << [x-2,y-1] if range.include?(x -2) && range.include?(y-1)   
        result
    end

    def isPositionValid(pos)
        range = (0...8)
        return range.include?(pos[0]) && range.include?(pos[1])
    end

    def new_move_positions(pos)
        @considered_positions << pos if isPositionValid(pos)
        return KnightPathFinder.valid_moves(pos).reject{|arr| @considered_positions.include?(arr)}
    end

    def build_move_tree()
        nodes = [@root_node]

        while(!nodes.empty?)
            head = nodes.shift()
            new_move_positions(head.value).map {|pos| PolyTreeNode.new(pos)}.each do |node|
                next if @considered_positions.include?(node.value)
                head.add_child(node)
                nodes << node
            end 
        end
    end
end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([6,2])
#kpf.new_move_positions([0,0])
#p kpf.new_move_positions([4,4])
#puts kpf.build_move_tree()

#kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
