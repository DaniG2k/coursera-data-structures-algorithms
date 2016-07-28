# Uses ruby

def optimal_points(segments)
  segments.sort_by! {|seg| seg[1]}
  points, current_seg, next_seg = [], 0, 1
  tail = segments[current_seg][1]
  limit = segments.size - 1
  
  while current_seg <= limit
    while next_seg <= limit && tail.between?(segments[next_seg][0], segments[next_seg][1])
      next_seg += 1
    end
    points << tail
    current_seg = next_seg
    next_seg += 1
    # Check if we're on the last iteration
    tail = segments[current_seg].nil? ? segments[current_seg - 1][1] : segments[current_seg][1]
  end
  puts points.size
  points.join(' ')
end
t = gets.chomp.to_i
segments = Array.new
t.times { segments << gets.chomp.split(' ').map {|n| n.to_i} }
puts optimal_points(segments)
