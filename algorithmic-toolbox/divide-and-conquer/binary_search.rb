#!/usr/bin/ruby

def binary_search(ary, low, high, key)
  return -1 if high < low

  midpoint = low + ((high - low) / 2)

  if key == ary[midpoint]
    midpoint
  elsif key < ary[midpoint]
    binary_search(ary, low, midpoint - 1, key)
  else
    binary_search(ary, midpoint + 1, high, key)
  end
end

ary = gets.chomp.split(' ').map(&:to_i)[1..-1]
seek = gets.chomp.split(' ').map(&:to_i)[1..-1]

result = Array.new
seek.each do |key|
  result << binary_search(ary, 0, ary.size-1, key)
end
puts result.join(' ')
