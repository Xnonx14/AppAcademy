def all_words_capitalized?(arr)
    arr.all? { |ele| ele.capitalize == ele}
end

def no_valid_url?(arr)
    sites = ["com","net", "io", "org"]
    arr.none? {|ele| sites.include?(ele.split(".")[1]) }
end

def any_passing_students?(arr)
    arr.any? do |hash|
        avg = (hash[:grades].sum) / hash[:grades].length 
        avg >= 75
    end
end 

