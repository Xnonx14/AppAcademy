def reverser(string,&block)
    #reverse first
    block.call(string.reverse)
end

def word_changer(string, &block)
    result = []
    string.split(" ").each do |word|
        result << block.call(word)
    end 
    result.join(" ")
end

def greater_proc_value(n, prc1, prc2)
    num1 = prc1.call(n)
    num2 = prc2.call(n)
    if num1 > num2
         return num1
    end
    num2
end

def and_selector(arr, prc1, prc2)
    arr.select do |ele|
        prc1.call(ele) && prc2.call(ele)
    end
end

def alternating_mapper(arr, prc1, prc2)
    result = []
    arr.each_with_index do |el, i|
        if i.even?
            result << prc1.call(el)
        else
            result << prc2.call(el)
        end
    end
    result
end


