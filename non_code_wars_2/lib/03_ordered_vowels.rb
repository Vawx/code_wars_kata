
def ordered_vowel_words( str )
    split_string = str.split( " " ) # split string by space
    return_string = "" # blank string to fill
    
    split_string.each do |word| # for each split_string word
        if ordered_word( word ) # is word ordered
           return_string += word # add it to fill string
           if split_string.index( word ) < split_string.length - 1 # if index of word is less than length of string
               return_string += " " # add space
           end
        end
    end
    return_string # return string
end

# checks if word is ordered
def ordered_word( word )
    used = word.scan( /[aeiou]/ )  # scan word for vowels
    split_word = word.split( // ) # split word for loop
    
    used.sort! # sort vowels to be in order [abc...]
    current_vowel_index = 0 # current vowel to check
    split_word.each do |letter| # loop by letter
        if used.include?( letter )  # does the used vowels include this letter
            if used[ current_vowel_index ] == letter # is the sorted array element of vowels equal to the letter found
                current_vowel_index += 1 # add one to the vowel index
            else
                return false # if doesnt match ordered vowels, return as not ordered
            end
        end
    end
    return true # made it through, word vowels are ordeded 
end

#"this is a test of the system"
#get_first_vowel_index( "is" )
#puts ( ordered_vowel_words("this is a test of the vowel ordering system") )

#puts( ordered_word( "complicated" ))
#puts( ordered_word("amends"))