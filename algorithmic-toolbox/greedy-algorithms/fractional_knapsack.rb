# Uses ruby

def get_optimal_value(capacity, weights, values)
  a = Array.new(weights.size, 0)
  v = 0
  # The knapsack needs to be sorted as such:
  # (v1 / w1) >= (v2 / w2)
  h = Hash.new
  values.each_with_index {|v, i| h[v.to_f / weights[i]] = [weights[i], v]}
  # Sort in reverse order
  sorted_hash = h.sort {|a, b| b <=> a}
  weights = sorted_hash.map {|_, w| w[0]}
  values = sorted_hash.map {|_, v| v[1]}

  (0..weights.size-1).each do |i|
    if capacity.zero?
      return v.round(4)
    else
      amin = [weights[i], capacity].min
      v += amin * (values[i].to_f / weights[i])
      weights[i] -= amin
      a[i] += amin
      capacity -= amin
    end
  end
  v.round(4)
end

data = gets.chomp.split.map {|n| n.to_i}
vals = Array.new
data[0].times { |line| vals << gets.chomp.split.map {|n| n.to_i} }
values = vals.map {|i| i[0] }
weights = vals.map {|i| i[1] }
puts get_optimal_value(data[1], weights, values)
