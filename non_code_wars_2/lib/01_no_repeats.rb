
def no_repeats( year_start, year_end )
    years = [ ] # store found "no repeat years"
    for year in year_start..year_end # loop through length of years
        if !has_repeat( year ) && !years.include?( year ) # if year value doesnt have repeat values and is not included in years array
           years.insert( 0, year )  # add it to years array
        end
    end
    years.sort # sort and return years - test needs to be in order from small to large
end

# checks if year has a repeating value
def has_repeat( year )
    split_year = year.to_s.split(//) # split year, as string
    store_split = "" # to store year, during loop
    split_year.each do |i| # loop string, which is from year integer
        if store_split.include?( i ) # does the collected store_split string already include the value of i
           return true; # it repeats
        end
        store_split += i # didnt repeat this time, add i to string
    end
    return false # made it through loop without a repeat, it doesnt repeat
end

#no_repeats(1980, 1987)