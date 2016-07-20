# Uses ruby
#require 'benchmark'

def gcd(a, b)
  a, b = a.abs, b.abs
  while b > 0
    a, b = b, a % b
  end
  a
end

def lcm(a, b)
  (a * b) / gcd(a, b)
end

#Benchmark.bm do |x|
#  x.report { lcm(6, 8) }
#  x.report { lcm(28851538, 1183019) }
#end

a, b = gets.split.map {|num| num.to_i}
puts lcm(a, b)
