#!/usr/bin/env ruby


SMALL = %w(zero one two three four five six seven eight nine ten
           eleven twelve thirteen fourteen fifteen sixteen seventeen
           eighteen nineteen)

TENS = %w(wrong wrong twenty thirty forty fifty sixty seventy
          eighty ninety)

BIG = [nil, "thousand"] +
      %w( m b tr quadr quint sext sept oct non dec).map{ |p| "#{p}illion" }


def wordify number
  if number < 0
    "negative #{wordify -number}"

  elsif number < 20
    SMALL[number]

  elsif number < 100
    div, mod = number.divmod(10)
    "#{TENS[div]}-#{wordify mod}".chomp("-zero")

  elsif number < 1000
    div, mod = number.divmod(100)
    "#{wordify div} hundred #{wordify mod}".chomp(" and zero")

  else
    # separate into 3-digit chunks
    chunks = []
    div = number
    while div != 0
      div, mod = div.divmod(1000)
      chunks << mod # will store smallest to largest
    end

    if chunks.length > BIG.length
      raise ArgumentError, "Integer value too large."
    end

    chunks.map{ |c| wordify c }.
           zip(BIG). # zip pairs up corresponding elements from the two arrays
           find_all { |c| c[0] != 'zero' }.
           map{ |c| c.join ' '}. # join ["forty", "thousand"]
           reverse.
           join(' '). # join chunks
           strip
  end
end


 # Request input from user
 print "Enter the amount: "

 # Flush output buffers
 STDOUT.flush

 # Store the input
 money = gets.chomp

 # Set input to integer and use the wordify method to convert to words
 number = money.to_i

 # Split input on decimal point and select the amount the right of the decimal
 cents = money.to_s.split(".")[1]
 cents = (input ||= "").empty? ? "00" : input


 # Create string combining the results, capitalize first letter, and show results
 raw_string = "#{wordify number} and #{cents}/100 dollars"
 new_string = raw_string.slice(0,1).capitalize + raw_string.slice(1..-1)
 puts "\"#{new_string}\""


