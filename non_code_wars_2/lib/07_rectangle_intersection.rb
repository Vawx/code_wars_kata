def rec_intersection( rect1, rect2 )
  
  min_x = [ rect1[ 0 ][ 0 ], rect2[ 0 ][ 0 ] ].max
  max_x = [ rect1[ 1 ][ 0 ], rect2[ 1 ][ 0 ] ].min
  
  min_y = [ rect1[ 0 ][ 1 ], rect2[ 0 ][ 1 ] ].max
  max_y= [ rect1[ 1 ][ 1 ], rect2[ 1 ][ 1 ] ].min

  # no intersecion
  return nil if ( ( max_x < min_x ) || ( max_y < min_y ) )

  [ [ min_x, min_y ], [ max_x, max_y ] ]
end

# You can calculate the left-most x coordinate of the
# intersection by taking the maximum of the left-most x coordinate of
# each rectangle.

# you can calculate the top-most y
# coordinate of the intersection by taking the minimum of the top most
# y coordinate of each rectangle.
