def select_even_nums(arr)
    arr.select { |ele| ele.even? }
end

def reject_puppies(arr)
    arr.reject { |hash| hash["age"] <= 2}
end

def count_positive_subarrays(arr)
    arr.count { |subarr| subarr.sum > 0 }
end

def aba_translate(str)
    result = []
    vowels = "aeiou"
    str.each_char do |ch|
        if vowels.include?(ch)
            result << ch + "b" + ch
        else
            result << ch
        end
    end
    result.join("")
end

def aba_array(arr)
    arr.map { |e| aba_translate(e)}
end 

