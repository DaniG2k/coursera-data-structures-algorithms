# Uses ruby

def get_fibonacci_huge(n, m)
  modulos, i = [0, 1], 0
  until i > 0 && modulos[i] == 0 && modulos[i+1] == 1
    modulos.push(((modulos[i] % m) + (modulos[i+1] % m)) % m)
    i += 1
  end
  modulos[n % i]
end

a, b = gets.split.map {|num| num.to_i}
puts get_fibonacci_huge(a, b)