def hipsterfy(word)
    if word.rindex(/[aeiou]/) == nil
        return word
    else
        word[word.rindex(/[aeiou]/)] = ""
        word
    end

    # vowels = "aeiou"
    # i = word.length - 1
    # while i >= 0
    #     if vowels.include?(word[i])
    #         word[i] = ""
    #         return word
    #     end
    #     i -= 1
    # end
    # word
end


def vowel_counts(str)
    hash = Hash.new(0)
    vowels = "aeiou"
    str.downcase.each_char do |char|
        if vowels.include?(char)
            hash[char] += 1
        end
    end
    hash
end

def caesar_cipher(str, num)
    alpha = ("a".."z").to_a
    arr2 = alpha.clone
    removed = arr2.shift(num)
    shifted = arr2 + removed
    result = []
    str.each_char do |ch|
        if (alpha.index(ch) != nil) 
            result << shifted[alpha.index(ch)]
        else
            result << ch
        end
        
    end
    result.join("")
end 