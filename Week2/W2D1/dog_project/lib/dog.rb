class Dog
    def initialize(name, breed, age, bark, arr)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = arr
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def age=(age)
        @age = age
    end

    def bark
        return @bark.upcase if @age > 3
        return @bark.downcase   
    end

    def favorite_foods
        @favorite_foods
    end

    def favorite_food?(string)
        return (@favorite_foods.any?{|s| s.casecmp(string) == 0})
    end
    
end
