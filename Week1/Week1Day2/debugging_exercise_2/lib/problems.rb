# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.


#arr of factors, find largest prime in arr


def largest_prime_factor(num)
    arr = []
    (1..num).each do |e|
        arr << e if num % e == 0
    end

    result = arr.select { |el| prime?(el)}

    result[-1]
end

def prime?(num)
    return false if num < 2

    (2...num).each do |p|
        return false if num % p == 0
    end
    true
end


def unique_chars?(str)
    hash = Hash.new(0)
    str.each_char do |ch|
        hash[ch] += 1
    end

    return false if hash.values.any? { |val| val > 1}
    return true 
end

#Hash of arrays
#iterate, find count of letter, find index
def dupe_indices(arr)
    hash = Hash.new { |k, v| k[v] = [] }

    arr.each_with_index do |ch, i|
        hash[ch] << i
    end
    result = {}
    hash.each do |k, v|
        result[k] = v if v.length > 1
    end
    result 
end


def ana_array(arr,arr2)
    hash = Hash.new(0)
    hash2 = Hash.new(0)
    arr.each do |char|
        hash[char] += 1
    end 

    arr2.each do |char|
        hash2[char] += 1
    end 
    return (hash == hash2)
end