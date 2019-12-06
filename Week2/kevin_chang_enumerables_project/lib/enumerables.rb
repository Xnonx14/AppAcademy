require "byebug"


class Array
    def my_each(&prc)
        self.map {|ele| prc.call(ele)}
        self
    end

    def my_select(&prc)
        result = []
        self.my_each do |ele|
            result << ele if prc.call(ele)
        end
        result
    end

    def my_reject(&prc)
        result = []
        self.my_each do |ele|
            result << ele if !prc.call(ele)
        end
        result
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        count = 0
        self.my_each do |ele|
            count += 1 if prc.call(ele)
        end
        count == self.length
    end

    def my_flatten()
        return self if self.my_all?{|ele| !ele.is_a?(Array)}
        result = []
        self.my_each do |ele|
            if ele.is_a?(Array)
                result += ele 
            else
                result << ele
            end
        end
        result.my_flatten
    end

    def my_zip(*arg)
        #result = Array.new(self.length) {Array.new(arg.length + 1,nil)}
        clone = arg.unshift(self)
        (0...self.length).map do |i|
            (0...arg.length).map do |j|
                clone[j][i] #result[i][j] = 
            end
        end
        #result
    end

    def my_rotate(num=1)
        clone = self.clone
        if num < 0
            (0...num.abs).each do |i|
                popped = [clone.pop]
                clone = popped + clone
            end
            return clone
        end
        # shifted = clone.shift
        (0...num).each do |i|
            shifted = clone.shift
            clone += [shifted]
        end
        clone
    end

    def my_join(str="")
        result = ""
        self.each_with_index do |ele, i|
            result += ele
            if self.length - 1 != i
                result += str
            end
        end
        result
    end

    def my_reverse
        result = []
        self.each do |ele|
            result.unshift(ele)
        end
        result
    end

end
