def bubble_sort( arr )
    
    arr_length = arr.length
    
    loop do
        swapping = false
        ( arr_length - 1 ).times do |i|
            if arr[ i ] > arr[ i + 1 ]
                lower = arr[ i ]
                arr[ i ] = arr[ i + 1 ]
                arr[ i + 1 ] = lower
                swapping = true
            end
        end
        break if !swapping
    end
    arr
end
