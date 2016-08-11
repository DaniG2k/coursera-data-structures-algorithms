#!/usr/bin/ruby

def optimal_weight(max_weight, item_weights)
  cols = max_weight
  rows = item_weights.size
  matrix = Array.new(rows, Array.new(cols, 0))

  (0..rows-1).each do |row|
    current_weight = item_weights[row]
    puts "Item weight: #{current_weight}"
    puts "Row: #{row}"
    (0..cols).each do |col|
      puts "Col: #{col}\tcurrent weight: #{current_weight}\tLess than col? #{current_weight <= col}\tRow-1 val: #{matrix[row-1][col-current_weight]}"
      if current_weight <= col
        
      end
    end
    sleep 2
    puts "\n\n"
  end
  matrix
end

#p optimal_weight(7, [1, 3, 4, 5])
p optimal_weight(7, [1, 3])
