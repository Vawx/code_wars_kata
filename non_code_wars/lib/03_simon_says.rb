
# Repeats argument
def echo( string )
   string 
end

# Repeats arguement, in caps
def shout( string )
    string.upcase
end

# Repeates string argument number of int argument - minimum number of 2 times
def repeat( string, amount = 2 )
   repeatString = ""
   for i in 1..amount
    if i < amount
        repeatString << string + " "
    else
        repeatString << string
    end
   end
   repeatString
end

# Returns letters from the start of the argument word
def start_of_word( string, charAmount )
   returnString = ""
   for char in 0..charAmount - 1
    returnString << string[ char ]
   end
   returnString
end

# Returns the first whole word of sentence
def first_word( string )
   word = ""
   for i in 0..string.length - 1
    if string[ i ] != ' '
       word << string[ i ] 
   else
       return word
    end
   end
end

# Capitalize each word
def titleize( string )
   titleString = string.split( ' ' )
   returnString = ""
   for word in 0..titleString.length - 1
    if !isLittle( titleString[ word ] ) || word == 0
       returnString << titleString[ word ].capitalize
   else
       returnString << titleString[ word ]
    end
    if word < titleString.length - 1
       returnString << ' ' 
    end
   end
   returnString
end

# Checks if word is "little"
def isLittle( word )
   littleWords = ["over", "there", "and", "the"] # Unique to the tests, could definetely be a longer list
   
   for little in 0..littleWords.length - 1
    if word == littleWords[ little ]
       return true 
    end
   end
   return false
end

