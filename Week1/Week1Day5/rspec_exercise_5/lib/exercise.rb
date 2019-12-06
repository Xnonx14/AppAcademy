# should accept any number of arrays of the same length as arguments
# should return a 2D array where each subarray contains the elements at the same index from each argument
def zip(*arr)
    new_arr = []
    i = 0
    while i < arr[0].length
        temp = []
        arr.each do |subarray|
            temp << subarray[i]
        end
        new_arr << temp
        i += 1
    end
    new_arr
end

# should accept an array and two procs as arguments
# should return a new array containing the elements that return true for exactly one of the procs
# should return elements in the same order they appear in the input array
def prizz_proc(arr, prc1, prc2)
    arr.select do |e|
        prc1.call(e) != prc2.call(e)
    end
end

#should accept any number of arrays as arguments
#should return a 2D array where each subarray contains the elements at the same index from each argument
#should use nil to substitute elements for the array that are too short
def zany_zip(*arr)
    max_length = 0
    arr.each do |x|
        if x.length > max_length
            max_length = x.length
        end
    end
    result = []
    i = 0
    while i < max_length
        temp = []
        arr.each do |subarray|
            temp << subarray[i]
        end
        result << temp
        i += 1
    end
    result
end

#  should accept an array and a block as args
# should return the element that has the largest result when passed into the block
# when there is a tie
#   should return the element that appears later in the array
# when the array is empty should return nil
def maximum(arr, &prc)
    return nil if arr.empty?
    current_ele = nil
    current_max = nil
    arr.each do |ele|
        value = prc.call(ele)
        if current_max == nil || value >= current_max
            current_max = value
            current_ele = ele
        end
    end
    current_ele
end

# hash = Hash.new {|h,k| h[k]=[]}   If no key is found, use the block
# hash = Hash.new([])               All empty keys point to the same array
# hash = Hash.new {[]}              Returns an empty array but it doesn't save the key into the hash
def my_group_by(array, &prc)
    hash = Hash.new {|h,k| h[k]=[]}
    array.each do |ele|
        value = prc.call(ele)
        hash[value] << ele
    end
    hash  
end

def max_tie_breaker(array, proc, &block)
    max = nil 
    result = nil 
    # 3, 3, 7, 10
    array.each do |ele|
        value = block.call(ele)
       if (max == nil) || (value > max)
            max = value
            result = ele  
       elsif  value == max  
            proc_value1 = proc.call(ele)
            proc_value2 = proc.call(result)
            if proc_value1 > proc_value2
                max = value  
                result = ele  
            end 
       end 
    end 
    result 
end

def vowel_count(word)
    count = 0 
    vowels = "aeiouAEIOU"
    word.each_char {|char| count += 1 if vowels.include?(char) }
    count 
end 

def remove(word)
    vowels = "aeiouAEIOU"
    first_index = nil 
    last_index = nil 
    word.each_char.with_index do |char, idx|
        if vowels.include?(char)
            last_index = idx  
            if first_index == nil   
                first_index = idx 
            end 
        end 
    end 
    word[first_index..last_index]
end 

def silly_syllables(sentence)
    parts = sentence.split(" ")
    parts.map do |word|
        if vowel_count(word) > 1  
            remove(word)
        else  
            word  
        end
    end.join(" ")
end