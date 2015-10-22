# reverses words
def reverser
    reverseWords( yield ) # yield return value of reverseWords
end

# reverses word, or words if string is more than one
def reverseWords( string )
    splitWords = string.split( ' ' ) # Split string by space
    combined = ""
    rev = ""
    
    for word in 0.. splitWords.length - 1 # for each of the splitWords
        lastIndex = splitWords[ word ].length - 1 # get index of word
        lastIndex.downto( 0 ) do |char| # loop from end to start of word
          rev += splitWords[ word ][ char ] # add each character to rev
        end
        
        combined += rev # add rev to combined
        if word < splitWords.length - 1 # if current word isnt last in splitWords
           combined += " " # add a space 
        end
        rev = "" # reset rev back to nothing to be used again in loop
    end
    combined # return combined sentense, as reveresed words [not reversed sentence]
end

# Adder
def adder( value = 1)
    add_to( yield, value ) # yield value passed into add_to with what to add it to - [ yield + value = return ]
end

# Add one value with another
def add_to( current, plus )
   current += plus
end

# Repeater
def repeater( amount = 0 )
    if amount == 0
        yield
    else
       amount.times do |i|
           yield i # yield amount times, as i
       end
    end
end


#puts( adder( 3 ) )
#puts( reverseWords( "hello world" ) )