#!/usr/bin/ruby

# Dynamic programming. This is similar to the coin changing
# problem. Only difference is we're using [n-1, n/3, n/2] (our
# permitted operations) instead of using coins of different
# denominations.
def min_ops(n)

  # Step 1:
  # Create a table containing the minimum operations
  # needed to reach n given our permitted operators.
  all_parents = Array.new
  all_min_ops = [0] + [nil] * n

  (1..n+1).each do |k|
    curr_parent = k - 1
    curr_min_ops = all_min_ops[curr_parent] + 1
    [2, 3].each do |i|
      if k % i == 0
        parent = k / i
        num_ops = all_min_ops[parent] + 1
        if num_ops < curr_min_ops
          curr_parent, curr_min_ops = parent, num_ops
        end
      end
    end
    all_parents[k], all_min_ops[k] = curr_parent, curr_min_ops
  end

  # Step 2: Trace back to find the optimal choices
  # made in the previous step.
  numbers = Array.new
  k = n
  while k > 0
    numbers << k
    k = all_parents[k]
  end
  puts numbers.size - 1
  numbers.reverse
end

n = gets.chomp.to_i
puts min_ops(n).join(' ')
