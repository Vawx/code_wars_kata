=begin
Complete the function caffeineBuzz, which takes a non-zero integer as it's one argument.

If the integer is divisible by 3, return the string "Java".

If the integer is divisible by 3 and divisible by 4, return the string "Coffee"

If the integer is one of the above and is even, add "Script" to the end of the string.

Otherwise, return the string "mocha_missing!"

caffeineBuzz(1)   => "mocha_missing!"
caffeineBuzz(3)   => "Java"
caffeineBuzz(6)   => "JavaScript"
caffeineBuzz(12)  => "CoffeeScript"
=end

def caffeineBuzz( n )
    caffeine = ""
    if  n % 3 == 0 
        caffeine = "Java"
    end
    if n % 4 == 0
       if caffeine != ""
          caffeine = "Coffee" 
       end
    end
    if caffeine != "" && n.even?
       caffeine += " Script" 
    end
    return ( caffeine != "" ) ? caffeine : "mocha_missing!"
end

puts caffeineBuzz(1) #, "mocha_missing!")
puts caffeineBuzz(3) #, "Java")
puts caffeineBuzz(6) #, "JavaScript")
puts caffeineBuzz(12) #, "CoffeeScript")