def pattern(n)
  current = 1;
  pattern = ""
  while current <= n
    for i in 1..current
      pattern += current.to_s
    end
    current += 1
    pattern += "\n" if current <= n
  end
  return pattern
end

puts( pattern( 5 ) )