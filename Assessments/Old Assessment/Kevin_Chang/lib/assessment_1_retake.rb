# Define your methods here.

#Is there a map method for string?
def string_map!(string, &block)
    string.each_char.with_index do |ch,i|
        string[i] = block.call(ch)
    end
end

def three?(arr, &block)
    arr.count { |e| block.call(e) == true} == 3
end

#elegant one liner
def nand_select(arr, proc1, proc2)
    #return arr.select {|e| !(proc1.call(e) && proc2.call(e))}    

    result = []
    for e in arr
        if proc1.call(e) && proc2.call(e)
            next
        end
        result << e
    end
    result
end

#elegant one liner
#  hash.values.inject(0) {|sum,arr| sum += arr.sum}
def hash_of_array_sum(hash)
    sum = 0
    for k,arr in hash
        for e in arr
           sum += e 
        end
    end
    sum
end

def abbreviate(sentence)
    vowels = "aeiouAEIOU"
    result = []
    words = sentence.split(" ")
    for word in words
        if word.length > 4
            #remove vowels
            temp = []
            word.each_char do |char|
                if !vowels.include?(char)
                    temp << char
                end
            end
            result << temp.join("")
        else
            result << word
        end
    end

    result.join(" ")
end

def hash_selector(hash, *args)
    return hash if args.length == 0
    result = Hash.new(0)
    for arg in args
        result[arg] = hash[arg] if hash[arg] != nil 
    end
    result
end