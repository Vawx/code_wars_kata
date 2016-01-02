# Dictionary class that stores a hash full of entries. entries can be added, collected, sorted, printed as a string, and checked
class Dictionary
    # Init class with empty hash
    def initialize
        @entries = {}
    end
    
    # entries accessor
    def entries
       @entries
    end
    
    # adds a new key to the entries, regardless of value
    def add( toAdd )
        if toAdd.is_a?(Hash) # if toAdd is a hash
            toAdd.each do |keyWord, value|
               @entries[ keyWord ] = value # add as hash
            end
        else
            @entries[ toAdd ] = nil # if toAdd is NOT a hash, use keyword, as toAdd, to add a nil value
        end
    end
    
    # keys accessor : returns the sorted keywords of entries
    def keywords
       @entries.keys.sort # sorts keys to alphabetical 
    end
    
    # checks if entries included the word passed in
    def include?( word )
        @entries.each do |keyWord, value|
            if word == keyWord # does word match keyword, return true as the hash is stored for word
                return true
            end
        end
        return false # word not found as keyword in entries, not included
    end
    
    # finds a hash value based on keyword, or prefix of keyword
    def find( word )
        t = { } # start with empty hash
        @entries.each do |keyWord, value|
            if word == keyWord || keyWord.start_with?( word ) # does word match keyword or does keyword start with word
                t[keyWord] = value # set the local hash by keyword and value of current loop
            end
        end
        t # return local hash
    end
    
    # sorts, concatenates, and returns printable string of current entries
    def printable
        asPrintable = ""
        doCount = 0 # way to keep track of the entries loop so a new line can be added to the end of the concat string
        @entries.sort.each do |keyWord, value|
            asPrintable += "[#{keyWord}] \"#{value}\""
            if doCount < @entries.length - 1 # in order for test to pass, it cant have a extra line at the end
                asPrintable += "\n"          # only add one if not the last element of the hash
            end
            doCount += 1 # each loop adds one
        end
        asPrintable # return concat string
    end
end
