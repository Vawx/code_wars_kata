def ftoc( temp )
    temp = ( ( temp - 32.0 ) * 5.0 ) / 9.0
end

def ctof( temp )
   temp = ( ( temp * 9.0 ) / 5.0 ) + 32.0
end

# Conversion to celciius is: current - 32 * 5 / 9
# Conversion to fahrenheit is: current * 9 / 5 + 32 