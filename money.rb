#!/usr/bin/env ruby

   require 'enumerator'

    # Request input from user
    print "Enter the dollar amount in decimal form "
    # Flush output buffers
    STDOUT.flush
    # Store the input
    money = gets.chomp
    # Split on decimal
    amt = money.split('.')

    dollars = amt[0]
    cents = amt[1]

    a = dollars.each_slice(3) do |b|


    puts "You have $#{ dollars } dollars and #{ cents.to_s } cents"
