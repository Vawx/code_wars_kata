# Class override, for Arry
class Array
    
    # Return 0 if Array holds nothing, or sum of all elements if holds more than nothing
    def sum
        return 0 if length == 0 
        
        s = 0
        for i in 0..length - 1
            s += self[ i ]
        end
        s
    end
    
    # Returns the array passed in with squared values
    def square
        return [] if length == 0
        
        for s in 0..length - 1
            self[ s ] *= self[ s ]
        end
        return self
    end
    
    # Method to return and assign value without needing = [internally does the same thing as square, so just return square]
    def square!
        return square
    end
end
