def nearest_larger( arr, idx )
    j = nil
    puts( arr[ idx ] )
    range_of_array = arr.size + 1 # start max size of array + 1
    arr.each do |value| # for each of the arr elments                   # if argument array elment is less than the value of the looping arr element
        if arr[ idx ] < value && arr.index( value ) <= range_of_array   # and the arr index value of the loop is less than the size of the range_of_array
           j = arr.index( value ) # set j as the index, for return                                   
           range_of_array = idx - j # reduce size of range_of_array to that of the array element minus the found array element of j
        end
    end
    puts( arr[ j ] )
    puts( j )
    j # return found index, which if used in arr array returns the larger value nearest to that of arr[ idx ]
end

#"should return the nearer of two greater numbers" 
#nearest_larger([2, 6, 9, 4, 8], 3) # == 2

# Write a function, `nearest_larger(arr, i)` which takes an array and an
# index.  The function should return another index, `j`: this should
# satisfy:
#
# (a) `arr[i] < arr[j]`, AND
# (b) there is no `j2` closer to `i` than `j` where `arr[i] < arr[j2]`.
#
# In case of ties (see example below), choose the earliest (left-most)
# of the two indices. If no number in `arr` is larger than `arr[i]`,
# return `nil`.

