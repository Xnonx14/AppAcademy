def my_reject(arr, &block)
    new_arr = []
    for e in arr
        new_arr << e if !block.call(e)
    end
    new_arr
end

def my_one?(arr, &block)
    new_arr = []
    for e in arr
        new_arr << e if block.call(e)
    end 
    new_arr.length == 1
end

def hash_select(hash, &block)
    new_hash = {}
    for k,v in hash
        new_hash[k] = v if block.call(k,v)
    end
    new_hash
end

def xor_select(arr, prc1, prc2)
    result = []
    arr.each do |e|
        b1 = prc1.call(e)
        b2 = prc2.call(e)
        result << e if (b1 && !b2) || (!b1 && b2)
    end 
    result
end

def proc_count(ele, arr)
    count = 0
    arr.each do |prc|
        count += 1 if prc.call(ele)
    end
    count
end

