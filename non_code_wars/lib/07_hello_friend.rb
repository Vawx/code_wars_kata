# Object class, Friend
class Friend
    
    # Greeting to friend
     def greeting( who = "" )
         if who == ""  
            return "Hello!" # Some friends have no name
         end
         "Hello, #{who}!" # Friend has a name, us it as a part of greeting
     end
end
