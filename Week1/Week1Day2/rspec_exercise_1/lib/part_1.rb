def average(num1, num2)
    sum = num1 + num2
    sum / 2.0
end

def average_array(arr)
    sum = arr.inject { |acc, el| acc + el}
    sum / (arr.length * 1.0)
end

def repeat(str, num)
    result = str * num
end


def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    arr = str.split(" ").each_with_index do |ele, i|
        if i.even?
            ele.upcase!
        else
            ele.downcase!
        end
    end
    arr.join(" ")
end

