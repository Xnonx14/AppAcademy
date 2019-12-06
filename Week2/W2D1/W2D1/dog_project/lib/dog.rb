class Dog
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        return @name
    end

    def breed
        return @breed
    end

    def age
        return @age
    end

    def age=(new_age)
        @age = new_age
    end

    def bark
        if @age > 3
            return @bark.upcase
        else
            return @bark.downcase
        end
    end
    def favorite_foods
        return @favorite_foods
    end
        
    
    #https://ruby-doc.org/core-2.5.1/String.html#method-i-casecmp
    #s.casecmp(string) == 0
    def favorite_food?(str)
        @favorite_foods.any? {|food| food.casecmp?(str)} 
    end


end
