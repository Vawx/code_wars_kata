def combine_arrays( arr1, arr2 )
    m = arr1.length
    n = arr2.length
    
    while m > 0 and n > 0
        if arr1[ m - 1 ] > arr2[ n - 1 ] # if arr1 m length -1 one elment is greater to n - 1 elment of array 2
            arr1[ m + n - 1 ] = arr1[ m - 1 ] # move arr1 element as current m length - 1 to the value of both m and n lenghts - 1
            m -= 1 # subtract length of m
        else
            arr1[ m + n - 1 ] = arr2[ n - 1 ] # if arr 1 m length - 1 isnt greater, assign arr2 n - 1 element to length of m + n - 1 in arr1
            n -= 1 # subtract length of n
        end
    end

    arr1
end

#puts combine_arrays([1, 3, 5], [2, 4, 6]) # == [1, 2, 3, 4, 5, 6]