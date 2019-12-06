require "part_1"
require "byebug"

def partition(arr, num)
    result = [[],[]]
    arr.each do |e|
        if e < num 
            result[0] << e
        else
            result[1] << e
        end
    end 
    result
end


def merge(hash1,hash2)
    result = Hash.new(0)
    hash1.each do |k,v|
        result[k] = hash1[k]
    end 
    hash2.each do |k,v|
        result[k] = hash2[k]
    end 
    result
end 

def censor(sentence,array)
    new_array = sentence.split(" ")
    vowels = "aeiouAEIOU" 
    new_array.each_with_index do |word, idx|
        if array.include?(word.capitalize) || array.include?(word.downcase) || array.include?(word.upcase)
            new_word =""
            word.each_char do |char|
                if vowels.include?(char)
                    new_word += "*"
                else
                    new_word += char
                end 
            end 
             new_array[idx] = new_word
        end 
    end 
    new_sentence = new_array.join(" ")
end 

#number as an arg
# 1 2 4 8 16 32 64 ... 2**n

def power_of_two?(number)
    (0..number).each do|num| 
        # 2**num == 16
        if 2**num == number
            return true
        end 
        if 2**num > number
            return false 
        end
    end 
    return "problem"
end


    