

# Translates word to "piglatin"
def translate( string )
   pigLatinWord = ""
   splitWords = string.split( ' ' ) 
   
    for word in 0..splitWords.length - 1 # Start loop through them
    
        if splitWords[ word ].length > 1 # if current splitWord is longer than 1 character
            if isPunctuation( splitWords[ word ][ 0 ] ) # if the first element of word is puncuation
                isWordCap = splitWords[ word ][ 1 ] == splitWords[ word ][ 1 ].upcase # Store if current splitWord is capitalized, based on second element as first is puncuation
                splitWords[ word ].downcase! # Remove caps from words
            else
                isWordCap = splitWords[ word ][ 0 ] == splitWords[ word ][ 0 ].upcase # Store if current splitWord is capitalized, based on first element as it is NOT puncuation
                splitWords[ word ].downcase! # Remove caps from words
            end
        end

        punc = getPunctuation( splitWords[ word ] ) # Store puncuation
        for j in 0..punc.length - 1 # loop through punc array of hash values
            if punc[ j ][:found] != nil # as long as :found is not null
                if splitWords[ word ].length == 1 # if splitWords is only one character
                   pigLatinWord += punc[ j ][:found] + " " # assign pigLatinWord of found puncuation as it is the only character in the word
               else
                   splitWords[ word ].delete!( punc[ j ][:found] ) # word is longer than one character, remove any puncuation from it so it can be shifted
                end
            end
        end
        
        if isVowel( word[ 0 ] ) # If first element of word is a vowel
            splitWords[ word ] = splitWords[ word ] + "ay" # PigLatin it up
        else
            if !isPunctuation( splitWords[ word ] ) # make sure split word isnt puncuatioin
                shift = shiftWord( splitWords[ word ] ) # If first letter is not a vowel, shift it using shiftWord
                splitWords[ word ] = shift + "ay" # PigLatin it up, now
            end
        end
        
        splitWord = splitWords[ word ] # Store splitWord
        if isWordCap # If word was capitalized
           splitWord.capitalize! # Capitalize translation
        end
        
        if !isPunctuation( splitWords[ word ] ) # check again if word isnt puncuation
            for i in 0..punc.length - 1 # loop through puncuation array again
                if punc[ i ][:found ] != nil # make sure found isnt nil
                    puncString = punc[ i ][:found] # store found puncuation as string
                    if punc[ i ][:atStart] # if current found puncuation is at start of word
                        splitWord.insert( 0, puncString ) # insert found puncuation at start splitWord
                    else
                        splitWord.insert( splitWord.length, puncString ) # found puncuation isnt at start, insert it at the end of splitWord
                    end
                end
            end
            
            pigLatinWord += splitWord # Concat word to pigLatinWord
        
            if word < splitWords.length - 1 # if word, as element, is less than length of splitWords array
               pigLatinWord += " " # Add a space between word
            end
        end
   end
   
   pigLatinWord # Return altered string, as PigLatin
end

# Shifts a word based on constanants - moves them to the end, in order
def shiftWord ( word )
    consts = ""
    shift = ""
    
    phoneme = getPhoneme( word ) # Get phoneme, if doesnt exist, first element is "NIL", as string
    if phoneme != "NIL" # If found phoneme
        phonemeString = phoneme.join( phonemeString ) # Store array of phoneme as string
        shift = word.slice( phonemeString.length, word.length ) + phonemeString # Shift word is word sliced at start of size of phoneme to length of word PLUS the found phoneme string
    else
        for char in 0..word.length - 1 # Didn't find phoneme
            if !isVowel( word[ char ] ) # If word element, as char, is not a vowel
              consts += word[ char ] # Add word element, as char, to consts string
            else
                shift = word.slice( consts.length, word.length ) + consts # if no longer a consonant, slice word by length of consts to length of word, assign to shift 
                break # break loop
            end
        end
    end
    shift # Return shift
end

# Checks if char is vowel
def isVowel( char )
   vowels = ['a', 'e', 'i', 'o', 'u'] 
   
   for check in 0..vowels.length - 1
    if char == vowels[ check ] # char matches a vowel, so it is one, return true
       return true 
    end
   end
   return false # no matches found between vowels and char, return false
end

# Checks if word starts with phoneme
def getPhoneme( word )
    phonemes = [ "qu", "sch" ] # phonemes used in tests
    
    for pho in 0..phonemes.length - 1 # Loop phonemes length
        if word.include? phonemes[ pho ] # does word include a phoneme?
            phoneme = word.scan( phonemes[ pho ] ) # Store the phoneme word includes
            imbeded = phoneme[ 0 ][ 0 ] != word[ 0 ] # if first char element of included phoneme DOESNT match the first char elment of the word argument, it is imbeded - assign imbeded as true. if not, imbeded is false
            
            if imbeded # If phoneme is imbeded
                for i in 0..phoneme.length - 1 # Loop through included phoneme, as i
                    phoneme.insert( i, word[ i ] ) # Insert at i the same element of the word
                                                   # [ Since phoneme is imbeded, we need to include the characters that came before it as the phoneme for Pig Latin to work ]
                end
            end
            return phoneme # return found phoneme
        end
    end
    return "NIL" # no phoneme found, return "NIL" that can be referenced as return value
end

# Checks if char is puncuation
def isPunctuation( char )
    punc = [ ',', '.', '-', ';', ':', '?', '(', ')' ]
    
    for i in 0..punc.length - 1
        if char == punc[ i ] # if char is punctuation, return true
           return true 
        end
    end
    return false; # return false
end

# Returns puncuation from word, as well as if it starts the word
def getPunctuation( word )
    punc = [ ',', '.', '-', ';', ':', '?', '(', ')' ]
   
    foundPunc = [ { "found" => "NIL", "atStart" => false }, { "found" => "NIL", "atStart" => false } ]
   
    foundCount = 0; # Using insert didnt work as intended - would insert multiple of the same; i think it has to do with scope - keep track of foundPunc array with int
    i = 0
    while i < word.length # loop through word
        j = 0
        while j < punc.length # loop through puncuation
            if word [ i ] == punc[ j ] # if word character equals current puncuation
               foundPunc[ foundCount ][:found] = punc[ j ] # store it in foundPunc
               foundPunc[ foundCount ][:atStart] = ( i == 0 && word.length > 1 )
               foundCount += 1 # move foundPunc forward
            end
            j += 1
        end
        i += 1
    end
    return foundPunc # return foundPunc array
end
