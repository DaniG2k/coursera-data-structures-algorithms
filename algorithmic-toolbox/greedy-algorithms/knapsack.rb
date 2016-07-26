def knapsack(total_weight, ws, vs)
  a = Array.new(ws.size, 0)
  v = 0
  (0..ws.size-1).each do |i|
    if total_weight.zero?
      return [v, a]
    else
      amin = [ws[i], total_weight].min
      v += amin * (vs[i].to_f / ws[i])
      ws[i] -= amin
      #puts "Adding #{ws[i]} to knapsack with val #{vs[i]}"
      a[i] += amin
      total_weight -= amin
      #puts "Total weight: #{total_weight}"
    end
  end
  return [v, a]
end

w1, v1 = 20, 20 
w2, v2 = 5, 10
w3, v3 = 4, 20

p knapsack(10, [w3, w2, w1], [v3, v2, v1])
