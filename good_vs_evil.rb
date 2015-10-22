=begin
Description

Middle Earth is about to go to war. The forces of good will have many battles with the forces of evil. Different races will certainly be involved. Each race has a certain 
'worth' when battling against others. On the side of good we have the following races, with their associated worth:

Hobbits - 1
Men - 2
Elves - 3
Dwarves - 3
Eagles - 4
Wizards - 10
On the side of evil we have:

Orcs - 1
Men - 2
Wargs - 2
Goblins - 2
Uruk Hai - 3
Trolls - 5
Wizards - 10
Although weather, location, supplies and valor play a part in any battle, if you add up the worth of the side of good and compare it with the worth of the side of evil,
the side with the larger worth will tend to win.

Thus, given the count of each of the races on the side of good, followed by the count of each of the races on the side of evil, determine which side wins.

Input:

The function will be given two parameters. Each parameter will be a string separated by a single space. Each string will contain the count of each race on the side of good and evil.

The first parameter will contain the count of each race on the side of good in the following order:

Hobbits, Men, Elves, Dwarves, Eagles, Wizards.
The second parameter will contain the count of each race on the side of evil in the following order:

Orcs, Men, Wargs, Goblins, Uruk Hai, Trolls, Wizards.
All values are non-negative integers. The resulting sum of the worth for each side will not exceed the limit of a 32-bit integer.

Output:

Return ""Battle Result: Good triumphs over Evil" if good wins, "Battle Result: Evil eradicates all trace of Good" if evil wins, or "Battle Result: No victor on 
this battle field" if it ends in a tie.
=end


def goodVsEvil( good, evil )
    goodWorthByIndex = [ 1, 2, 3, 3, 4, 10 ]
    evilWorthByIndex = [ 1, 2, 2, 2, 3, 5, 10 ]
    goodValue = getSum( good, goodWorthByIndex ) 
    evilValue = getSum( evil, evilWorthByIndex ) 
    if goodValue == evilValue
        return "Battle Result: No victor on this battle field"
    end
    return goodValue > evilValue ? "Battle Result: Good triumphs over Evil" : "Battle Result: Evil eradicates all trace of Good"
end

def getSum( group, worth )
    sum = 0 
    of = group.split( ' ' )
    for i in 0..of.length - 1
        if of[ i ].to_i > 0
            for j in 1..of[ i ].to_i
                sum += worth[ i ].to_i
            end
        end
    end
   return sum
end

puts goodVsEvil('1 0 0 0 1 0', '0 0 0 0 0 1 0') #== 'Battle Result: No victor on this battle field', 'Should be a tie' )
puts goodVsEvil('1 0 0 0 0 0', '1 0 0 0 0 0 0') #== 'Battle Result: No victor on this battle field', 'Should be a tie' )
puts goodVsEvil('0 0 0 0 0 10', '0 1 1 1 1 0 0') # == 'Battle Result: Good triumphs over Evil', 'Good should triumph' )
puts goodVsEvil('0 0 0 0 0 10', '0 1 1 1 1 0 0') #== 'Battle Result: Good triumphs over Evil', 'Good should triumph' )
puts goodVsEvil('707 423 584 293 572 62', '136 864 0 626 15 152 121') # == "Battle Result: Good triumphs over Evil"