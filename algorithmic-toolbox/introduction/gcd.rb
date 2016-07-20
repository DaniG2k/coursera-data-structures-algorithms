# Uses ruby
#require 'benchmark'
def gcd(a, b)
  while b != 0
    tmp = b; b = a % b; a = tmp;
  end
  a
end

a, b = gets.split.map {|num| num.to_i}
puts gcd(a, b)
#Benchmark.bm do |x|
#  x.report {gcd(18, 35)}
#  x.report {gcd(28851538, 1183019)}
#end
