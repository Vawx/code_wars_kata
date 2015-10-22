def letter_count( str )
    string_split = str.split(//) # split argument into string
    letter_collection = { } # to collect letters
    
    string_split.each do |letter| # for each of the split string
        if letter != " " # if letter isnt space
            if letter_collection.include?( letter ) # if the letter collection includes the ltter
                letter_collection[letter] += 1 # add 1 to the hash key, of letter
            else
                letter_collection.merge!( { letter => 1 } ) # if letter isnt included in the letter_collection, merge it with the new letter with the value of 1
            end
            end
    end
    letter_collection # return letter_collection
end

#puts( letter_count("cats are fun") )