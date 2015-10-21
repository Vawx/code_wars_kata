=begin
Given a non-negative integer, return an array / a list of the individual digits in order.

Examples:

123 => [1,2,3]

1 => [1]

8675309 => [8,6,7,5,3,0,9]
=end

def digitize( n )
    list = []
    n.to_s.chars.each do |j|
       list.push( j.to_i ) 
    end
    return list
end

puts digitize( 8675309 )