=begin
Create a function which checks a number for three different properties.

is the number prime?
is the number even?
is the number a multiple of 10?
Each should return either true or false, which should be given as an array. Remark: The Haskell variant uses data Property.

Examples

number_property(7)  # ==> [true,  false, false] 
number_property(10) # ==> [false, true,  true]
The number will always be an integer, either positive or negative. Note that negative numbers cannot be primes, but they can be multiples of 10:

number_property(-7)  # ==> [false, false, false] 
number_property(-10) # ==> [false, true,  true]
=end

def number_property( n )
    return[ is_prime( n ), is_even( n ), is_multiple( n, 10 ) ]
end

def is_prime( n )
    return false if n <= 0
    prime = true
    for i in 2..n - 1
        if  n % i == 0
            prime = false
        end
    end
    return prime
end

def is_even( n )
    return n.even?
end

def is_multiple( n, m )
    return n != 0 && m % n == 0 
end

puts number_property( 2 )
