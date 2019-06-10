

class Dog

    def initialize (name,breed,age,bark,favorite_foods)
        @name = name 
        @breed = breed 
        @age = age 
        @bark = bark
        @favorite_foods = favorite_foods

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

    def age=age
        @age=age
    end


    def bark
        if @age>3
            @bark.upcase
        else
            @bark.downcase
        end
    end


    def favorite_foods
        @favorite_foods
       
    end

    def favorite_food?(food_item)
        # return food_item
        for item in @favorite_foods
            if food_item.downcase == item.downcase
                return true
           
            end
        
        end
        false
    end



end
