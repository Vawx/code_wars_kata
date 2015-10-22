def word_unscrambler(str, words)
    collected_words = [] # stores any unscrambled words
    split_words = words.join( "," ) # join words by ,
    split_words = split_words.split( "," ) # split words and remove ,

    split_words.each do |word| # for each split word
       if conect_chars_with_word( str, word ) # does split word connect with str
          collected_words.push( word ) # push found unscrambed word into collected
       end
    end
    collected_words
end

# checks if word unscrambles to str
def conect_chars_with_word( str, word )
   split_word = word.split( // ) # split word into characters
   matching_char_count = 0 # if chars are included in str, add to this
   
   split_word.each do |char| # loop through split word characters
       if str.include?( char ) # does str have this character
          matching_char_count += 1 # add to char_count
       end
   end
   return str.size == matching_char_count # if the char count equals 
end

#puts word_unscrambler("turn", ["numb", "turn", "runt", "nurt"])