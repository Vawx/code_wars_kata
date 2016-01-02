# Uses an array as a "stack" to use RPN for calculating
class RPNCalculator
    
    # Init an array and a value 
    def initialize
       @storage = [] 
       @value = 0
    end
    
    # Accessor for storage, returns a error with cause if storage is empty
    def storage
        if @storage.empty?
           raise 'calculator is empty' 
        end
        @storage.sort.reverse
    end
    
    # Acessor for value
    def value
        @value
    end
    
    # Push a value into storage
    def push( value )
       @storage.push( value ) 
    end
    
    # Called to add
    def plus
        find_calc( "+" )
    end
    
    # Called to subtract
    def minus
        find_calc( "-" )        
    end
    
    # Called to divide
    def divide
        find_calc( "/" )        
    end
    
    # Called to multiply
    def times
        find_calc( "*" )        
    end
    
    # Converts a string into integer and operators to be used for calculation
    def tokens( value )
       mathSigns = [ '*', '/', '+', '-' ] # To check against operators
       token = [] # Stores the integers and operators into an array
       vSplit = value.split( ' ' ) # get the arguement and split it by spaces
       
       vSplit.each do |v| # for each of the split string
            if mathSigns.include?( v ) # does the current split of the argument string match any of the mathSigns
               token.push( v.to_sym ) # if so, add it to array as a symbol
            else
                token.push( v.to_i ) # if not, add it to the array as a integer
            end
       end
       token
    end
    
    # Takes in a token array, of integers and operators, and computes it using the RPN method
    def evaluate( token )
        mathSigns = [ '*', '/', '+', '-' ] # mathSigns to compare with elments of token so method knows when to calculate 
        tSplit = tokens( token ) # get array of integers and operators to run calculation, using the tokens method
        tSplit.each do |t| # for each of the tokens
            if t.is_a?(Fixnum) # is it a number, push it into @storage
                push( t ) 
            elsif
                case t # if its not a number, run calculation based on switch of what the current operator is
                    when :+
                        plus
                    when :-
                        minus
                    when :*
                        times
                    when :/
                        divide
                end
            end
        end
        @value
    end
    
    # universal calculation method - more effecient than doing individual calculations in new functions
    def find_calc( string ) 
        storage # run this to check if storage is empty, will throw error if is
        symbol = string.to_sym # take passed in string, convert to symbol
        
        one = @storage.pop # pop to get last element
        two = @storage.pop
        
        case symbol # run switch of symbol to get calculation
            when :+
                @value = two.to_f + one.to_f   
            when :-
                @value = two.to_f - one.to_f
            when :*
                @value = two.to_f * one.to_f
            when :/
                @value = two.to_f / one.to_f
        end
        push( @value ) # add result back into @storage
    end
end


=begin

    def plus
        storage
        one = @storage.pop
        two = @storage.pop
        @value = two.to_f + one.to_f
        push( @value )
    end
    
    def minus
        storage
        one = @storage.pop
        two = @storage.pop
        @value = two.to_f - one.to_f
        push( @value )
    end
    

    def divide
        storage
        one = @storage.pop
        two = @storage.pop
        @value = two.to_f / one.to_f
        push( @value )
    end
    
    def times
        storage
        one = @storage.pop
        two = @storage.pop
        @value = two.to_f * one.to_f
        push( @value )
    end
    
=end