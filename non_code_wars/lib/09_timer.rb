# Timer class : converts a whole time, in seconds, to a readable time output, as string
class Timer
   
    def initialize()
        @seconds = 0
    end

    # seconds modifier
    def seconds=(value)
        @seconds = value
        @time_string = convert_whole_time_to_format( value )
    end
    
    # seconds accessor
    def seconds
       @seconds 
    end
   
    # timer_string accessor  
    def time_string
       @time_string
    end
   
    # Converts whole seconds time into a readable "time format"
    def convert_whole_time_to_format( seconds )
        formatString = "" # string to hold format
        hms = [ 0,0,0 ] # default hours-minutes-seconds
        
        while seconds > 60 # while seconds is greater than 60
            if seconds >= 3600 # if seconds is greater than 1 hour
               hms [ 0 ] += 1 # add hour 
               seconds -= 3600 # remove hour from seconds
            else 
                hms[ 1 ] += 1 # if not hour, its minutes and if still greater than 60, add to minutes
                seconds -= 60 # subtract minute from seconds
            end
        end
        hms[ 2 ] = seconds # remaining value is seconds
        
        for i in 0..hms.length - 1 # for each of the hms elements
            formatString += padded( hms[ i ] ) # pad element value, if needed
            
            if i < hms.length - 1 # if hms is not at the end, add a colon to separate hours:minutes:seconds
               formatString += ":" 
            end
        end
        formatString # return format string
    end
    
    # Utility that takes in int value and "pads" it with extra 0, if int value is less than 10
    def padded( value )
        pad = ""
        if value >= 10
            pad = value.to_s 
        else
            pad = "0" + value.to_s
        end
    end
end
