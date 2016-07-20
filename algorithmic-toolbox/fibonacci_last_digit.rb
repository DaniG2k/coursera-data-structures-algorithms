# Uses ruby
#require 'benchmark'
def get_fibonacci_last_digit(n)
  m = [[1, 1], [1,0]]
  (2..n).each do |i|
    m00 = m[0][0] % 10
    m10 = m[1][0] % 10
    m = [[m00 + m[0][1] % 10, m00], [m10 + m[1][1] % 10, m10]]
  end
  m[0][1]
end

#Benchmark.bm do |x|
#  [0, 1, 3, 239, 327305, 613455, 999999].each do |i|
#    x.report {get_fibonacci_last_digit(i)}
#  end
#end

n = gets.chomp.to_i
puts get_fibonacci_last_digit(n)
