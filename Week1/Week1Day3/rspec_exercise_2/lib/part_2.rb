def palindrome?(str)
    new_str = ""
    str.each_char do |ch|
        new_str = ch + new_str 
    end 
    return true if new_str == str
    return false
end

#apple
#0 -> 5 arr[5]
#str[3..3]

def substrings(string)
    array = []
    (0..string.length).each do |i|
        ((i+1)..string.length).each do |j|
            array << string[i..(j-1)]
        end 
    end 
    array
end 

#map
#select
#count
#reject
#any none all
def palindrome_substrings(string)
    ss = substrings(string)
    results = ss.select do |ele|
        palindrome?(ele) && ele.length > 1
    end 
    results 
end 
