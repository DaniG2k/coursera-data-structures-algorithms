# Uses ruby
def calc_fib(n)
  return n if n <= 1
  a, b = 0, 1
  (n-1).times { tmp = a; a = b; b = tmp + a }
  b
end

n = gets.chomp.to_i
puts calc_fib(n)
