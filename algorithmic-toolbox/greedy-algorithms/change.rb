# Uses ruby
def get_change m
  denominations = [10, 5, 1]
  counter = 0
  denominations.each do |coin|
    while m >= coin && m > 0
      m -= coin
      counter += 1
    end
  end
  counter
end

m = gets.chomp.to_i
puts get_change(m)
