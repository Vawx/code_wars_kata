def isomorph_word( word, word_two )
    split_string_one = word.to_s
    split_string_two = word_two.to_s
   
    new_word = ""
    split_string_two.chars.each do |c|
         current = c
         next_loop = false
         split_string_one.chars do |a|
            next if next_loop == true
            current_two = split_string_one.chars[ split_string_two.chars.index( c ) ]
            if a == current_two
                new_word += c
                next_loop = true
            end
         end
    end
    new_word == word_two
end

#puts isomorph_word( "turtle", "tletur" )