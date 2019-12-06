class Board
    attr_reader :size
    def initialize(size)
        @size = size
        @grid = Array.new(size) {Array.new(size)}
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos,mark)
        @grid[pos[0]][pos[1]] = mark
    end

    def complete_row?(mark)
        @grid.any? do |row|
            row.all?{|ele| ele == mark}
        end
    end

    def complete_col?(mark)
        for i in (0..@grid.length-1)
            complete = true
            for j in (0..@grid.length-1)
                if @grid[j][i] != mark
                    complete = false
                end
            end
            return true if complete == true
        end
        return false
    end

    def complete_diag?(mark)
        result = 0
        for i in (0...@grid.length)
            if @grid[i][i] == mark
                result += 1
            end
        end
        return true if result == 3 
        #check other diag
        result = 0
        for i in (0..@grid.length)
            result += 1 if @grid[@grid.length - 1 - i][i] == mark
        end
        return true if result == 3
        return false 

    end

    def winner?(mark)
        return true if self.complete_col?(mark)
        return true if self.complete_row?(mark)
        return true if self.complete_diag?(mark)
        return false
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
