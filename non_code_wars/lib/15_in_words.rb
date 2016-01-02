# Fixnum extended class to convert literal interger values into text
class Fixnum
    
    # Root class that will convert Fixnum value into text
    def in_words
        
        # Words that trascribe 0 to 19
        zero_to_19 = { 0 => 'zero',
                       1 => 'one',
                       2 => 'two',
                       3 => 'three',
                       4 => 'four',
                       5 => 'five',
                       6 => 'six',
                       7 => 'seven',
                       8 => 'eight',
                       9 => 'nine',
                       10 => 'ten',
                       11 => 'eleven',
                       12 => 'twelve',
                       13 => 'thirteen',
                       14 => 'fourteen',
                       15 => 'fifteen',
                       16 => 'sixteen',
                       17 => 'seventeen',
                       18 => 'eighteen',
                       19 => 'nineteen' }
        
        # Words that transcribe 20 to 90
        twenty_by_10 = { 20 => 'twenty',
                       30 => 'thirty',
                       40 => 'forty',
                       50 => 'fifty',
                       60 => 'sixty',
                       70 => 'seventy',
                       80 => 'eighty',
                       90 => 'ninety' }
                       
        current = self # get reference to self, which is Fixnum value
        
        # switch through to decide what to do with value
        case current
            when 0..19
                return zero_to_19[ current ] # Get direct transcribe for 0 to 19
            when 20..99
                if current % 10 == 0 # if the value is a value of 10
                    return twenty_by_10[ current ] # get transcribe directly from twenty_by_10
                else
                    by_ten = ( current / 10 ) * 10 # get tens value
                    by_one = current - by_ten # get remainder of tens value
                    return by_ten.in_words.to_s + " " + by_one.in_words.to_s # return tens value [space] remainder value
                end
            when 100..999 # if 100 to 999
                return hundred_in_words( current ) # get transcribe value from hundred_in_words
            when 1000..9999999 # if 1,000 to 999,999,999
                return thousand_in_words( current ) # get transcribe value from thousand_in_words
            when 1000000..999999999 # if 1,000,000,00 to 999,999,999,999
                return millions_in_words( current ) # get transcribe value from millions_in_words
            when 1000000000..999999999999 # if 1,000,000,000 to 999,999,999,999
                return billions_in_words( current ) # get transcribe value from billions_in_words
            when 1_000_000_000_000..2_000_000_000_000 # if trillion to two trillion
                return trillions_in_words( current ) # get transcribe value from trillions_in_words
            
        end
    end
    
    # Transcribe value to hundreds
    def hundred_in_words( value )
        by_100 = value # start with passeed in value
        by_100 /= 100 # divide that by 100, as value is from that range
        extra = value - ( by_100 * 100 ) # get remainder by taking full value and subtracting it by the divided value, mulitplied by 100
                    
        return ( extra > 0 ) ? by_100.in_words.to_s + " hundred " + extra.in_words.to_s : by_100.in_words.to_s + " hundred" # if extra is more than zero, return hundred + string + extra
                                                                                                                            # if extra is not more than zero, return hundred + string
    end
    
    # Transcribe value to thousands
    def thousand_in_words( value )
        return 'one thousand' if value == 1000 # if value is outright 1, 000, return 'one thousand', as no calculation is needed

        # get start and end values
        by_1000 = value
        by_1000 /= 1000
        by_100 = value - ( by_1000 * 1000 )
            
        by_1000 = by_1000.in_words # transcribe first part of return by words as this value will be within zero_to_19
            
        if by_100 >= 100 # if extra is more than 100, use hundred_in_words to get value
           by_100 = hundred_in_words( by_100 )
       else
           by_100 = by_100.in_words # if less than one hundred, use in_words to get transcribe 
        end

        return by_1000.to_s + " thousand " + by_100.to_s # return first part of return + string + last part of word
    end
    
    # Transcirbe value in millions
    def millions_in_words( value )
        return 'one million' if value == 1_000_000 # if value is outright 1,000,000, return 'one million', as no calculation is needed
        
        # get start and end values
        by_million = value
        by_million /= 1_000_000
        by_1000 = value - ( by_million * 1_000_000 ) 
    
        by_million = by_million.in_words # transcribe first part in_words, as itll be within zero_to_19
        
        if by_1000 >= 1000 # if remiander is more than 1,000
            by_1000 = thousand_in_words( by_1000 ) 
        elsif by_1000 > 100 # if not over 1,000, is it more than 100
            by_1000 = hundred_in_words( by_1000 )
        else
            by_1000 = by_1000.in_words # assign from in_words, as its less than 100
        end
        
        return by_million.to_s + " million " + by_1000.to_s # return first part + string + end part
    end
    
    # Transcribe value in billions
    def billions_in_words( value )
        return 'one billion' if value == 1_000_000_000 # if outright 1,000,000,000, return 'one billion'
       
        # get start and end values
        by_billion = value
        by_billion /= 1_000_000_000
        by_million = value - ( by_billion * 1_000_000_000 )
       
        by_billion = by_billion.in_words # transcribe first part from in_words, as itll be in zero_to_19
       
        if by_million >= 1000000 # if more than one million
           by_million = millions_in_words( by_million )
        elsif by_million >= 1000 # if more than 1,000
           by_million = thousand_in_words( by_million )
        elsif by_million >= 100 # if more than 100
            by_million = hundred_in_words( by_million )
        else
            by_million = by_million.in_words # less than all, use in_words
        end
        
        return by_billion.to_s + " billion " + by_million # return start + string + end
    end
    
    # Transcribe value in trillions
    def trillions_in_words( value )
        return 'one trillion' if value == 1_000_000_000_000 # if outright 1,000,000,000,000, return 'one trillion'
       
        # get start and end values
        by_trillion = value
        by_trillion /= 1_000_000_000_000
        by_billion = value - ( by_trillion * 1_000_000_000_000 )
       
        by_trillion = by_trillion.in_words # transcribe with in_words, as again value will be in zero_to_19
       
        if by_billion >= 1000000000 # if more than one billion
           by_billion = billions_in_words( by_billion )
        elsif by_billion >= 1000000 # if more than one million
            by_billion = millions_in_words( by_billion ) 
        elsif by_billion >= 1000 # if more than 1,000
            by_billion = thousand_in_words( by_billion )
        elsif by_billion >= 100 # if more than 100
            by_billion = hundred_in_words( by_billion )
        else
            by_billion = by_billion.in_words # less than all over conditionals, use in_words
        end
        
        return by_trillion.to_s + " trillion " + by_billion # return start + string + end
    end
    
end
