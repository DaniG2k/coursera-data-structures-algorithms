#!/usr/bin/ruby

def get_majority_element(ary)
  return ary[0] if ary.size == 1

  left = get_majority_element(ary[0..((ary.size/2)-1)])
  right = get_majority_element(ary[(ary.size/2)..-1])

  count = 0
  ary.each {|n| count += 1 if left == n}
  return left if count > ary.size / 2

  count = 0
  ary.each {|n| count += 1 if right == n}
  count > ary.size / 2 ? right : nil
end

a_size = gets.chomp.to_i
ary = gets.chomp.split(' ').map(&:to_i)
msg='The specified size of the array is not equivalent to the entered array.'
raise ArgumentError, msg unless a_size == ary.size

if get_majority_element(ary).nil?
  puts 0
else
  puts 1
end
