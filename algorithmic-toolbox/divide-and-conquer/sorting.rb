#!/usr/bin/ruby

def partition3(a, left, right)
  pivot = a[left]
  i = left
  lt = left
  gt = right
  while i <= gt
    if a[i] < pivot
      a[i], a[lt] = a[lt], a[i]
      lt += 1
      i += 1
    elsif a[i] > pivot
      a[i], a[gt] = a[gt], a[i]
      gt -= 1
    else
      i += 1
    end
  end
  return lt, gt
end

def partition2(a, l, r)
  x = a[l]
  j = l
  (l + 1..r).each do |i|
    if a[i] <= x
      j += 1
      a[i], a[j] = a[j], a[i]
    end
  end
  a[l], a[j] = a[j], a[l]
  j
end

def randomized_quick_sort(a, left, right)
  return nil if left >= right

  random_pivot = rand(left..right)
  a[left], a[random_pivot] = a[random_pivot], a[left]
  # Use partition3
  m1, m2 = partition3(a, left, right)
  randomized_quick_sort(a, left, m1 - 1);
  randomized_quick_sort(a, m2 + 1, right);
end

n = gets.chomp.to_i
a = gets.chomp.split(' ').map(&:to_i)

msg='The specified size of the array is not equivalent to the entered array.'
raise ArgumentError, msg unless a.size == n

randomized_quick_sort(a, 0, n - 1)
puts a.join ' '
