def puppy_golden_age( arr )
    start_index = 0
    end_index = 0
    largest = 0
    
    current_index = 0
    current_sum = [ [ 0, arr[ 0 ] ].max ] # first element max, if above zero

    
    ( 1...arr.size ).each do |j| # each element of the array, from 1 up
        current_sum[ j ] = [ 0, current_sum[ j - 1 ] + arr[ j ] ].max # add element to current sum that is maximum value between zero and the current_sum plus the current value of the array element

        if current_sum[ j - 1 ] <= 0 and current_sum[ j ] > 0 # if the current sum of element - 1 is zero and current sum of element is greater than zero               
           current_index = j  # current index starts now, as the last index of current sum is zero
        end
        
        if current_sum[ j ] > largest   # if current_sum element is more than largest
            start_index = current_index # set start index is current index - for next loop
            end_index = j # ending index is of current element
            largest = current_sum[ j ] # new largest value is the sum of the current sum element
        end
    end
    return [ start_index, end_index ] # return the start index that produces the greatest "golden year" or, sum between the end index
end


#puppy_golden_age([100, -101, 200, -3, 1000])
#puts puppy_golden_age([100, -101, 200, -3, 1000]) #== [2, 4]
#puts puppy_golden_age([5, 3, -5, 1, 19, 2, -4]) == [0, 5]