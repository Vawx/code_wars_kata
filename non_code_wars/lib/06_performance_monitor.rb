# Measure gap of time
def measure( testCount = 0 )
    start = Time.now # start time before yields
    if testCount == 0
        yield if block_given? # if testCount is 0, yield to block
    else
       testCount.times do yield( ) # for every testCount, yield to block
       end
    end
    finish = Time.now # finish time after yields
    if testCount == 0 
       testCount = 1 # set testCount to 1 after yields if its zero, so when we use it to divide times, its not divide-by-zero
    end
    elapsed = ( finish - start ) / testCount # total time is that of ending - start, divided by the argument being passed in, which vary by test - some tests simply want the yield and dont use the elapsed return
end
