#!/usr/bin/ruby

def optimal_weight(max_capacity, n, v)
  w = v
  # Create a matrix
  m = Array.new(n + 1){ Array.new(max_capacity, 0) }

  n.times do |i|
    max_capacity.times do |j|
      if j + 1 < w[i]
        m[i + 1][j] = m[i][j]
      elsif j >= w[i]
        m[i + 1][j] = [m[i][j], m[i][j - w[i]] + v[i]].max
      else
        m[i + 1][j] = [m[i][j], v[i]].max
      end
    end
  end
  # The final result in the matrix contains
  # the optimal weight.
  m[n][max_capacity-1]
end

max_capacity, n = gets.chomp.split(' ').map(&:to_i)
items = gets.chomp.split(' ').map(&:to_i)
puts optimal_weight(max_capacity, n, items)
