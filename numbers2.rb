#! /usr/bin/env/ ruby

class Cash

  LOW = %w[zero one two three four five six seven eight nine ten eleven twelve thirteen
    fourteen fifteen sixteen seventeen eighteen nineteen]

  MID = %w[zero zero twenty thirty forty fifty sixty seventy eighty ninety]

  HIGH = [nil, "thousand"] +
          %w( m b tr quadr quint sext sept oct non dec).map{ |p| "#{p}illion" }


  def stringify(number)
    if number < 0
      "negative #{stringify -number}"
    elsif number < 20
      LOW[number]
    elsif number < 100
      div,mod = number.divmod(10)
      "#{MID[div]} #{LOW[mod]}"
    elsif number < 1000
      div,mod = number.divmod(100)
      "#{LOW[div]} hundred #{stringify mod}"
    else
      chunks = []
      div = number
      while div != 0
        div,mod = div.divmod(1000)
        chunks << mod
      end

      chunks.map{ |c| stringify c }.
        zip(HIGH).
        find_all { |c| c[0] != 'zero'}.
        map{ |c| c.join ' '}.
        reverse.
        join(' ').
        strip
    end
  end
end

number = 44

# print "Enter a number: "
# number = gets.chomp.to_i


# cents = number.to_s.split(".")[1]
# cents = (input ||= "").empty? ? "00" : input

p = "#{stringify number} and /100 dollars"
puts p.capitalize
