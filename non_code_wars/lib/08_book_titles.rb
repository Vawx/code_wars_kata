# Book class, which obeys strange English capitalization rules, for titles
class Book
    
    # title setter
    def title=(value)
        @title = cap_words( value )
    end
    
    # title getter
    def title
       @title 
    end
    
    # capitalize title
    def cap_words( words )
        splitWords = words.split( ' ' ) # Split title to words
        returnString = "" # store generated title in string
        
        for word in 0..splitWords.length - 1 # loop through title words
            if should_cap( splitWords[ word ], word ) # if should_cap of word, in element
               splitWords[ word ].capitalize! # capitalize it, ! to return the string calling capitalize
            end

            returnString += splitWords[ word ] # concat returnString with splitWords current element, as: word 
            
            if word < splitWords.length - 1 # if the current element, as word, is less than length
               returnString += " " # add space to returnString concat string
            end
        end
        returnString # return new title
    end
    
    # should capitalize word
    def should_cap( word, element )
        noCapWords = [ 'the', 'a', 'an', 'and', 'in', 'of' ] 
       
        if element == 0 # titles always start capitalized, regardless of word. If the element of the word, in the title, is the first, capitalize it
           return true 
        end
       
        for i in 0..noCapWords.length - 1 # Loop through noCapWords
            if word == noCapWords[ i ] # if word argument is equal to a noCapWord, return false
                return false
            end
        end
        return true # didnt find any noCapWords, capitalize it
    end
end