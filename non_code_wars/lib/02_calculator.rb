# Add one and two
def add ( one, two )
    one + two
end

# Subtract one and two
def subtract( one, two )
   one - two 
end

# Get sum of values in array
def sum( numArray )
   sumValue = 0
   for element in 0..numArray.length - 1
    sumValue += numArray[ element ]
   end
   sumValue
end

# Product one and two
def multiply( one, two )
    one * two
end

# Product array of values
def multipyArray( numArray )
    product = 0
    for element in 0..numArray.length - 1
        product *= numArray[ element ]
    end
    product
end

# Power of one number, based on secon
def power( value, pow )
   result = 0
   for i in 0..pow
    result *= result
   end
   result
end

# Factorial of a number : Example[ 4! == 1x2x3x4 = 24 ]
def factorial( of )
   fact = 0
   for i in 0..of
    fact *= i
   end
   fact
end