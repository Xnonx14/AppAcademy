def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    true
end 

def nth_prime(n)
    primes = []
    i = 2
    while primes.length < n
        primes << i if is_prime?(i)
        i+=1
    end 
    primes[-1]
end 

def prime_range(min, max)
    primes = []
    (min..max).each do |i|
        primes << i if is_prime?(i)
    end
    primes
end