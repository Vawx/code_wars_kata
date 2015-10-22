def find_subsets( arr )
    used_arr = Array.new( arr.length )
    collect_subset( arr, used_arr, 0 ) 
end

def collect_subset( arr, used = [ ], start_idx = 0)
    collection = []
    
    if start_idx == arr.length
       arr.each do |a|
          if used[ arr.index( a ) ]
              if a != nil and a != " "
                collection.push( a )
            end
          end
       end
        puts collection.to_s
        return
    end
    
    # each index uses recursion to get both true and false versions of the subset
    # starts at 0, goes to arr.length
    used[ start_idx ] = true
    collect_subset( arr, used, start_idx + 1 )
    used[ start_idx ] = false
    collect_subset( arr, used, start_idx + 1 )
end

#find_subsets(["a", "b", "c", "e"])