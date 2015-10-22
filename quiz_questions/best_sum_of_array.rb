def best_sum_of_sub_array( arr )
    start_idx = 0   
    last_idx = 0
    largest = 0
    
    current_idx = 0
    current_sum = [ 0 ]
    
    ( 1...arr.length ).each do |i|
       current_sum[ i ] = current_sum[ i - 1 ] + arr[ i ] # new sum is is last sum plus current arr element
       
       if current_sum[ i - 1 ] <= 0 and current_sum[ i ] > 0 # if last sum is less than zero and new sum is more than zero
          current_idx = i # new index for new start point 
       end
       
       if current_sum[ i ] > largest # if current sum index is bigger than largest
            start_idx = current_idx  # new start idx, as current - could be assigned in past loops
            last_idx = i # last idx is that of current
            largest = current_sum[ i ] # largest is of current sum
       end
    end
    
    [ start_idx, last_idx ]
end

puts best_sum_of_sub_array([100, -101, 200, -3, 1000]) #== [2, 4]