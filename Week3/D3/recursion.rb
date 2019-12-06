#Warmup 
require "byebug"

def range(starting, ending) #0, 5
    return [] if ending <= starting #[]
    range(starting, ending - 1) << ending - 1 #0, 4 << 4, 3, 2, 1
end

def sum_iter(arr)
    sum = 0
    arr.each do |i|
        sum += i
    end    
    sum
end

def sum_recursive(arr)
    return 0 if arr.empty?
    sum_recursive(arr[0...-1]) + arr[-1]
end

def exp2(b,n)
    return 1 if n == 0
    return b if n == 1
    return exp2(b, n / 2) ** 2 if n.even?
    return b * (exp2(b, (n - 1) / 2) ** 2)
end

class Array
    def deepdup()
        return [] if self.empty?
        return self.clone() if self.none?{ |e| e.is_a?(Array) } #self = [[2][3,4,5]6,7,8,9] different object id
        ele = self[-1]
        #self = [[2],[3,4,5], 6,7,8,9]  = 3 differnect object id
        #self[0...-1].deepdup << ele

        if ele.is_a?(Array)
            self[0...-1].deepdup << ele.deepdup()
        else
            self[0...-1].deepdup << ele
        end      
    end
end

def fibonacci(n)
    return [0,1].take(n) if n <= 2 #[0, 1, 1, 2,3,5,8,13,21...]
    arr = fibonacci(n-1)    #[0,1]
    arr << arr[-1] + arr[-2] 
end


#RETURNS THE INDEX
# def bsearch(array, target)
#     return 0 if array[0] == target
#     return 1 if array[1] == target
#     return array.length-1 if array[-1] == target
#     return nil if array.length <= 2
#     #middle number
#     #if even [1,2,3,4]
#     middle_idx = array.length / 2   #2
#     #array[0...2]
#     #if odd [1,2,3,4,5] #2
#     #array[0...2], [middle_idx+1..-1]

#     return middle_idx if array[middle_idx] == target
#     if target > array[middle_idx]
#         return middle_idx + bsearch(array[middle_idx..-1], target)
#     else
#         bsearch(array[0..middle_idx], target)
#     end
    
# end 

#p bsearch([1, 2, 3], 1) # => 0
#p bsearch([2, 3, 4, 5], 3) # => 1
#p bsearch([2, 4, 6, 8, 10], 6) # => 2
#p bsearch([1, 3, 4, 5, 9], 5) # => 3
#p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
#p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# middle_idx = divide the arr / 2
# check if arr[middle_idx] < or > target
# if < then divide second half of arr
# else then divide first half of arr
# returning arr.index[target]


def bsearch(array, target)

    if array.length <= 2
        return 0 if array[0] == target
        return 1 if array[1] == target
        return nil
    end
  

    middle_idx = array.length / 2   #2

    return middle_idx if array[middle_idx] == target

    if target > array[middle_idx]
        result = bsearch(array[middle_idx+1..-1], target)
        return nil if result == nil
        (middle_idx + 1) + result
    else
        return bsearch(array[0...middle_idx], target)
    end
end 

def merge(arr1,arr2)
    result = []
    while arr1.length + arr2.length != 0
        if arr1.empty? 
            result << arr2.shift
        elsif arr2.empty?
            result << arr1.shift
        elsif arr1[0] < arr2[0]
            result << arr1.shift
        else
            result << arr2.shift
        end
    end
    result
end

#type returned is array
def merge_sort(arr)
    return arr if arr.length <= 1
    arr2 = arr.shift(arr.length / 2)
    merge(merge_sort(arr),merge_sort(arr2))
end

def subsets(arr)
    return [] if arr.empty?
    
end

#(0...str.length).each do |start|
    # (start...str.length).each do |i|
        # arr << str[start..i]
    # end
# end
