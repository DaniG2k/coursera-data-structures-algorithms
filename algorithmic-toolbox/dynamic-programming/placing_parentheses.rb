#!/usr/bin/ruby
require 'pry'
def eval_expr(a, op, b)
  case op
  when '+'
    a + b
  when '-'
    a - b
  when '*'
    a * b
  when '/'
    a / b
  else
    false
  end
end

def min_and_max(i, j, ops, matrix_min, matrix_max)
  mmin = Float::INFINITY
  mmax = -Float::INFINITY
  (i..j-1).each do |k|
    a = eval_expr matrix_max[i][k], ops[k], matrix_max[k+1][j]
    b = eval_expr matrix_max[i][k], ops[k], matrix_min[k+1][j]
    c = eval_expr matrix_min[i][k], ops[k], matrix_max[k+1][j]
    d = eval_expr matrix_min[i][k], ops[k], matrix_min[k+1][j]
    mmin = [mmin, a, b, c, d].min
    mmax = [mmax, a, b, c, d].max
  end
  [mmin, mmax]
end

def parentheses(expression)
  ops = expression.split(/\d/).reject {|e| e == ''}
  nums = expression.split(/\D/).map(&:to_i)
  #binding.pry
  n = nums.size

  # Set up the matrix
  matrix_min = Array.new(n, Array.new(n, 0))
  matrix_max = Array.new(n, Array.new(n, 0))
  
  n -= 1
  (0..n).each do |i|
    matrix_min[i][i] = nums[i]
    matrix_max[i][i] = nums[i]
  end
  
  (1..n).each do |s|
    (0..n-s).each do |i|
      j = i + s
      matrix_min[i][j], matrix_max[i][j] = min_and_max(i, j, ops, matrix_min, matrix_max)
    end
  end
  matrix_max[0][n]
end

p parentheses('1+5')
p parentheses('5-8+7*4-8+9')
