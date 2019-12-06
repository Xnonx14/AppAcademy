require_relative "enumerables.rb"

def factors(num)
    result = []
    (1..num).each do |factor|
        result << factor if (num % factor == 0)
    end
    result
end

def subwords(str, dictionary)
    result = []
    for word in dictionary
        result << word if str.include?(word)
    end
    result
end

def substrings(str)
    result = []
    (0...str.length).each do |i|
        (i...str.length).each do |j|
            result << str[i..j]
        end
    end
    result
end

# a = "school"
# p substrings(a) # [s, sc, sch, scho, schoo, school, ]

class Array
    #swapping 
    def bubble_sort!(&prc) 
        return self if self.empty? || self.length == 1
        prc ||= Proc.new{|ele,ele2| ele <=> ele2}
        sorted = false
        while !sorted
            sorted = true
            (0...self.length-1).each do |index|
                if prc.call(self[index], self[index+1]) == 1
                    self[index], self[index+1] = self[index + 1], self[index]
                    sorted = false
                end
            end
        end
        self
    end

    def bubble_sort
        self.clone.bubble_sort!
    end
end


#bubble_sort(&prc)
#substrings(string)
#subwords(word, dictionary)


#p factors(25)

# default procs
# def call_that_proc(val, &prc)
#     prc ||= Proc.new { |data| data.upcase + "!!" }
#     prc.call(val)
# end