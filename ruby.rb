#! /usr/bin/env ruby

TENS = %w( zero one two three four five six seven )
TWENS = %w( zero zero twenty thirty forty fifty sixty seventy)

def stringify(number)
  if number < 0
    "negative #{stringify -number}"
  elsif number < 20
    TENS[number]
  elsif number < 100
    div,mod = number.divmod(10)
    "#{TWENS[div]} #{stringify mod}"
  else
    puts "wait"
  end
end
