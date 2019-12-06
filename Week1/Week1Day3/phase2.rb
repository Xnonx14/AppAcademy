def divCounter(num)
    count = 0
    for i in (1..num)   #includes num and 1
        if num % i == 0
            count+=1
        end 
    end
    count
end 

def anti_prime?(num)
    max = (1...num).inject do |acc=1, i| 
        count = divCounter(i)
        if  count > acc
            acc = count
        else 
            acc
        end 
    end
    if divCounter(num) > max
        return true
    else
        false
    end 
end 

def matrix_addition(m1,m2)
    results = m1.clone()
    for i in (0..m1.length-1)
        for j in (0..m1[i].length-1)
            results[i][j] = m1[i][j] + m2[i][j] 
        end 
    end 
    results
end 

def divisors(num)
    res = []
    for i in (1..num)   #includes num and 1
        if num % i == 0
            res << i
        end 
    end
    res
end 

def mutual_factors(*arg)
    hash = Hash.new(0)
    args = arg.length

    arg.each do |num|
        arr = divisors(num)
        arr.each do |x|
            hash[x] += 1
        end 
    end
    result = []
    hash.each do |k,v|
        if v == args
            result << k
        end
    end
    result

end 


#1, 1, 2, 4, 7, 13, ... and so on

def tribonacci_number(num)
    index = num - 1
    if num == 0 || num == 1
        return 1
    elsif num == 2
        return 2
    end
    result = [1,1,2]

    (num-3).times do |c|
        result << result[-1] + result[-2] + result[-3]
    end 
    result[-1]

end 

