# Uses ruby

def optimal_summands(n)
  k, l, total = n, 1, 0
  nums = Array.new
  
  until total == n
    if k <= (l * 2)
      total += k
      nums << k
    else
      total += l
      nums << l
      k -= l
      l += 1
    end
  end
  
  puts nums.size
  nums.join(' ')
end

input = gets.chomp.to_i
puts optimal_summands(input)
