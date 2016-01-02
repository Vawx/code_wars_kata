class XmlDocument
    
    #init class with default hellow, if should indent, and a indent count, to keep track when constructing string
    def initialize( should_indent = false )
        @hello = "<#{hello}hello/>"       
        @indent = should_indent
        @indentCount = 0
    end
    
    # Accessor for hello
    def h
        @hello
    end
    
    # Creates hello, using options and/or block and if class instance has set indent
    def hello( options = { } )
        if block_given?
            if !@indent
                return "<hello>" + yield + "</hello>" # if not indent, return normal concat string with yield value
            else
                s = ""
                y = yield
                s += "<hello>\n" + y + "</hello>\n" # if indent, get yield, and construct string
                return s
            end
        end
        
        # if not block, is options empty?
        if options.empty?
            @hello # return default value for @hello
        elsif options.is_a?( Hash ) # if options is a Hash
            options.each do |k, v| # loop them 
                return "<hello #{k}=\'#{v}\'/>" # return first as "hello Key = value" 
            end
        end
    end
    
    # Creates goodebye, using block and/or indent
    def goodbye
        if block_given? # if block found
            if !@indent # if class set as indent
                return "<goodbye>" + yield + "</goodbye>" # no indent, return normal goodbye
            else
                s = indent_string # is indent, start by getting indent string
                y = yield # store yeild
                s += "<goodbye>\n" + y + s + "</goodbye>\n" # concat string with goodbye, yield, and indent
                return s
            end
        end
        "<goodbye/>"
    end
    
    # Creates come_back, using block and/or indent
    def come_back
        if block_given? # if found block
            if  !@indent # if indent not set
              return "<come_back>" + yield + "</come_back>" # default come_back string
           else
               s = indent_string # is indent class, get indent string
               y = yield # store yield
               s += "<come_back>\n" + y + s + "</come_back>\n" # make string from come_back, yield value, and indent string
               return  s
           end
        end
        "<come_back/>"
    end
    
    # Creates ok_fine : used as final indent test
    def ok_fine( options = { } )
        if options.is_a?(Hash) # if options is Hash
            options.each do |k, v| # loop through them
                if !@indent # if not indent
                    return "<ok_fine #{k}=\'#{v}\'/>" # return default ok_fine
                else
                    s = indent_string # is indent, get indent string
                    return s << "<ok_fine #{k}=\'#{v}\'/>\n" # return indent string and then default ok_fine
                end
            end
        end
    end

    # indents a string based on current indent count + one
    def indent_string
        s = ""
        @indentCount += 1
        s += "  " * @indentCount
    end
    
    # puts text into a hellow tag
    def get_inside_text( text )
       "<hello>#{ text }</hello>"
    end
    
    # sends the option as a tag
    def send( option ) 
        return "<#{option}/>" 
    end
     
end

=begin
xml = XmlDocument.new(true)
#x.ok_fine( )
puts( xml.hello do
      xml.goodbye do
        xml.come_back do
          xml.ok_fine(:be => 'that_way')
        end
      end
    end )
=end