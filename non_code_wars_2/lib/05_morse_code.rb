def morse_encode( str )
    split_string = str.split( " " )
    morse_string = ""
    split_string.each do |word|
        morse_string += get_morse_word( word )
        if split_string.index( word ) < split_string.length - 1
            morse_string += "  "
        end
    end
    morse_string
end

def get_morse_word( word )
   alphabet = { 'a' => '.-',
                'b' => '-...',
                'c' => '-.-.',
                'd' => '-..',
                'e' => '.',
                'f' => '..-.',
                'g' => '--.',
                'h' => '....',
                'i' => '..',
                'j' => '.---',
                'k' => '-.-',
                'l' => '.-..',
                'm' => '--',
                'n' => '-.',
                'o' => '---',
                'p' => '.--.',
                'q' => '--.-',
                'r' => '.-.',
                's' => '...',
                't' => '-',
                'u' => '..-',
                'v' => '...-',
                'w' => '.--',
                'x' => '-..-',
                'y' => '-.--',
                'z' => '--..'
              } 
    split_word = word.split(//)
    morse_word = ""
    split_word.each do |letter|
        morse_word += alphabet[letter]
        if split_word.index( letter ) < split_word.length - 1
           morse_word += " " 
        end
    end
    morse_word
end

#puts get_morse_word( "cat" )