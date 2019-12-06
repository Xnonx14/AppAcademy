def bsearch(array,target)
    return nil if array.empty?
    return 0 if array[0] == target
    splitter = array.length / 2
    l_arr = array[0...splitter] 
    r_arr = array[splitter+1..-1]
    if array[splitter] >= target
        result = bsearch(l_arr, target)
        return result if result == nil
        return splitter + result + 1
    else
        return bsearch(r_arr, target)
    end 

end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil