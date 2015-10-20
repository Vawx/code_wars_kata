=begin
As a part of this Kata, you need to find the length of the sequence in an array, between the first and the second occurance of a specified number.

For example, for a given array arr

[0, -3, 7, 4, 0, 3, 7, 9]
Finding length between two 7s like

`lengthOfSequence([0, -3, 7, 4, 0, 3, 7, 9], 7)` would return 5.

For sake of simplicity, there will only be numbers (positive or negative) in the supplied array.

If there are less or more than two occurances of the number to searched for, return 0.

=end

def length_of_sequence(arr,n)
    start = -1
    ending = -1
    for i in 0..arr.length
        if arr[ i ] == n and start == -1
            start = i 
        elsif arr[ i ] == n 
          if ending == -1
            ending = i - start + 1
          else
            return 0
          end
        end
    end
    return 0 if ending == -1 
    return ending
end

puts( length_of_sequence( [1, 1], 1 ) )