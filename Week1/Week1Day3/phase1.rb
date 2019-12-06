# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

#Assumptions that the input
    #has no duplicate values
#absolute           ().abs
#hash               

def strange_sums(arr)
    hash = Hash.new(0)
    arr.map do |ele|
        hash[ele.abs] += 1
    end
    
    hash.count do |h,v|
        v == 2
    end
end

# p pair_product([4, 2, 5, 8], 16)      # true
# p pair_product([8, 1, 9, 3], 8)       # true
# p pair_product([3, 4], 12)            # true
# p pair_product([3, 4, 6, 2, 5], 12)   # true
# p pair_product([4, 2, 5, 7], 16)      # false
# p pair_product([8, 4, 9, 3], 8)       # false
# p pair_product([3], 12))              #false

def pair_product(arr,num)
    arr.each_with_index do |ele, idx|
        arr.each_with_index do |e2, idy|
            if idx != idy
                if ele * e2 == num 
                    return true
                end
            end
        end
    end 
    return false
end 

def rampant_repeats(str, hash)
    result = []
    str.each_char do |char|
        if hash[char] != nil
            num = hash[char]
            result << char * num
        else
            result << char
        end 
        
    end 
    return result.join("") 
end 


def perfect_square(num)
    num % Math.sqrt(num) == 0
end



