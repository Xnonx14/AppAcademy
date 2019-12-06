def element_count(arr)
    countHash = Hash.new(0)
    arr.each do |ele|
        countHash[ele] += 1
    end 
    countHash
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, i|
        #hash[char] != nil
       if hash.has_key?(char)
            str[i] = hash[char]
       end 
    end
    str
end


def product_inject(numbers)
    numbers.inject{|acc,num| acc * num}
end 

