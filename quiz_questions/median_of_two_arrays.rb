def median_of_two_arrays( arr1, arr2 )
    m = arr1.length
    n = arr2.length
   
    while m > 0 and n > 0
        if arr1[ m - 1 ] > arr2[ n - 1 ]
           arr1[ m + n - 1] = arr1[ m - 1 ] 
            m -= 1
        else
            arr1[ m + 1 - 1 ] = arr2[ n - 1 ]
            n -= 1
        end
    end
    arr1[ arr1.length / 2 ]
end

#puts median_of_two_arrays([1, 3, 5], [2, 4, 6])