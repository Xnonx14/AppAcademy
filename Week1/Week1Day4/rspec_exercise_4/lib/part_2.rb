def proper_factors(num)
    arr = []
    (1...num).each {|i| arr << i if num % i == 0}
    arr
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    aliquot_sum(num) == num
end 


def ideal_numbers(n)
    result = []
    i = 1
    while result.length < n
        #for 
        result << i if perfect_number?(i)
        i += 1
    end
    result
end 

