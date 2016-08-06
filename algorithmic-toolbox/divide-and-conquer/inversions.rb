#!/usr/bin/ruby

def merge_sort(a)
  return a, 0 if a.size <= 1

  left, inversions_left = merge_sort(a[0..a.size/2 - 1])
  right, inversions_right = merge_sort(a[a.size/2..-1])

  merged_array, merged_inversions = merge(left, right)
  [merged_array, (merged_inversions + inversions_left + inversions_right)]
end

def merge(left, right)
  sorted = []
  inversions = 0
  until left.empty? || right.empty?
    if left[0] <= right[0]
      sorted << left.shift
    else
      sorted << right.shift
      inversions += left.size
    end
  end
  [sorted.concat(left).concat(right), inversions]
end

a_size = gets.chomp.to_i
ary = gets.chomp.split(' ').map(&:to_i)
msg='The specified size of the array is not equivalent to the entered array.'
raise ArgumentError, msg unless a_size == ary.size

puts merge_sort(ary)[1]
