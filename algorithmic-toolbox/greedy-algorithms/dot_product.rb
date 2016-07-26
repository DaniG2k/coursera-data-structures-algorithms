# Uses ruby
def min_dot_product(a, b)
  a.sort!
  b.sort! {|a,b| b <=> a}
  a.map.each_with_index {|n, i| n * b[i]}.reduce(:+)
end

len = gets.chomp.to_i
a = gets.chomp.split.map {|n| n.to_i}
b = gets.chomp.split.map {|n| n.to_i}
raise ArgumentError, "Length #{len} specified but the entered array lengths are #{a.length} and #{b.length}." if a.length != b.length || a.length != len || b.length != len
puts min_dot_product a, b
