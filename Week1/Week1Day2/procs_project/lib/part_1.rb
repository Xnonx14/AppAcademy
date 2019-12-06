def my_map(arr, &block)
    result = []
    arr.each do |ele| 
        result << block.call(ele) 
    end
    result
end

def my_select(arr, &block)
    result = []
    arr.each do |ele| 
        result << ele if block.call(ele)
    end
    result
end

def my_count(arr, &block)
    result = []
    arr.each do |ele| 
        result << ele if block.call(ele)
    end
    result.length
end 

def my_any?(arr, &block)
    arr.each do |ele| 
        return true if block.call(ele)
    end
    false
end 

def my_all?(arr, &block)
    arr.each do |ele| 
        return false if !block.call(ele)
    end
    true
end 

def my_none?(arr, &block)
    arr.each do |ele| 
        return false if block.call(ele)
    end
    true
end 

