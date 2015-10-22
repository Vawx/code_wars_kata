# Temperature class - takes in a hash pair that can convert between fahrenheit and celcius
class Temperature
  
    # init for Temperature
    def initialize( options={ } )
        @tempOptions = options
    end
    
    # convert option key to fahrneheit
    def in_fahrenheit
        @tempOptions = ( @tempOptions.key? ( :c ) ) ? ftoc( @tempOptions[:c] ) : @tempOptions[:f] # if key is :c, convert and return, if already fahrenheit, return it as is
    end
    
    # convert option key to celcius
    def in_celsius
        @tempOptions = ( @tempOptions.key? ( :f ) ) ? ctof( @tempOptions[:f] ) : @tempOptions[:c] # if key is :f, convert and return, if already celsius, return it as is
    end
    
    # conversion method, farhenheit to celsius
    def ftoc( temp )
        ( temp * 9.0 / 5.0 ) + 32.0
    end
    
    # conversion method, celsius to farhenheit
    def ctof( temp )
        ( temp - 32.0 ) * 5.0 / 9.0
    end
    
    # factory fahrenheit
    def Temperature.from_fahrenheit temp
        Temperature.new( :f => temp ) # only way for in_farenheit or in_celsius to have a reference is for a new object?
    end
    
     # factory celcius
    def Temperature.from_celsius temp
        Temperature.new( :c => temp ) # ^^^
    end
end

# Celsius sub class of temperature
class Celsius < Temperature
    def initialize( temp )
       @tempOptions = { :c => temp } # construct tempOptions directly as celsius
    end
end

# Fahrenheit sub class of temperature
class Fahrenheit < Temperature
    def initialize( temp )
       @tempOptions = { :f => temp } # construct tempOptions directly to farhenheit
    end
end


# <== [found out ternary works in ruby] ==>

# [Original] :
=begin
    # convert option key to fahrenheit
    def in_fahrenheit
       if @tempOptions.key?( :c )
          @tempOptions[:c] = ( @tempOptions[:c] * 9.0 / 5.0 ) + 32.0
       else
           @tempOptions[:f] #The key feels ambiguous here, as technically anything can be passed in - not just :c and :f 
       end
    end
    
    # convert option key to celcius
    def in_celsius
        if @tempOptions.key?( :f )
            @tempOptions[:f] = ( ( @tempOptions[:f] - 32.0 ) * 5.0 ) / 9.0
        else
            @tempOptions[:c] #Same concern here with in_farenheit
        end
    end
=end




