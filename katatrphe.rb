=begin
You have been employed by the Japanese government to write a function that tests whether or not a building is strong enough to withstand a simulated earthquake.

A building will fall if the magnitude of the earthquake is greater than the strength of the building.

An earthquake takes the form of a 2D-Array. Each element within the Outer-Array represents a shockwave, and each element within the Inner-Arrays represents a tremor. 
The magnitude of the earthquake is determined by the product of the values of its shockwaves. A shockwave is equal to the sum of the values of its tremors.

Example earthquake --> [[5,3,7],[3,3,1],[4,1,2]] ((5+3+7) * (3+3+1) * (4+1+2)) = 735

A building begins with a strength value of 1000 when first built, but this value is subject to exponential decay of 1% per year. For more info on exponential decay, follow this link 
- https://en.wikipedia.org/wiki/Exponential_decay

Given an earthquake and the age of a building, write a function that returns "Safe!" if the building is strong enough, or "Needs Reinforcement!" if it falls.
=end

def strong_enough( earthquake, age )
    magnitude = 1
    for i in 0..earthquake.length - 1
        adding_mag = 0
        for j in 0..earthquake[ i ].length - 1
            adding_mag += earthquake[ i ][ j ]
        end
        magnitude *= adding_mag
    end
    if exponential_decay( age ) >= magnitude
        return "Safe!"
    else
        return "Needs Reinforcement!"
    end
end

def exponential_decay( age )
    decay = 1000
    age.times do 
        decay = decay * 0.99
    end
    return decay
end

puts strong_enough([[2,3,1],[3,1,1],[1,1,2]], 2) # "Safe!"
puts strong_enough([[5,8,7],[3,3,1],[4,1,2]], 2) # "Safe!"
puts strong_enough([[5,8,7],[3,3,1],[4,1,2]], 3) # "Needs Reinforcement!"
puts strong_enough([[5, 1, 7], [1, 1, 1], [4, 1, 2]] , 100) # "Safe!"