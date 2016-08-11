#!/usr/bin/ruby

def levenshtein_distance str1, str2
  m, n = str1.length, str2.length
  return m if n == 0
  return n if m == 0
  d = Array.new(m+1) {Array.new(n+1)}

  (0..m).each {|i| d[i][0] = i}
  (0..n).each {|j| d[0][j] = j}
  (1..n).each do |j|
    (1..m).each do |i|
      d[i][j] = str1[i-1] == str2[j-1] ? d[i-1][j-1] : [d[i-1][j]+1,d[i][j-1]+1,d[i-1][j-1]+1,].min
    end
  end
  d[m][n]
end

str1 = gets.chomp
str2 = gets.chomp
puts levenshtein_distance str1, str2
