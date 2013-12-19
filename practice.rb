#! /usr/bin/env ruby
class Fizz

  def initialize(number)
    if number % 3 == 0 && number % 5 == 0
      puts "fizzbuzz"
    elsif number % 3 == 0
      puts "fizz"
    elsif number % 5 == 0
      puts "buzz"
    else
      puts "try again"
    end
  end
end

one = Fizz.new(30)
two = Fizz.new(650)
three = Fizz.new(34)
four = Fizz.new(60)
five = Fizz.new(5)
