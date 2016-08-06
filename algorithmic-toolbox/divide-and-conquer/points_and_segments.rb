#!/usr/bin/ruby

class Segment
  attr_accessor :a, :b
  def initialize(a, b)
    @a = a
    @b = b
  end
  def contains?(point)
    @a <= point && point <= @b
  end
end

def naive_count_segments(segments, points)
  points.map {|point| segments.count {|s| s.contains?(point)}}
end

def fast_count_segments(segments, points)
  count = {}
  segments_num = 0
  # Prefix by a, b or c so that sorting segments and points
  # works as expected.
  list_points = segments.map {|seg| [seg.a, 'a_begin']}
  list_points += points.map {|point| [point, 'b_point']}
  list_points += segments.map {|seg| [seg.b, 'c_end']}

  list_points.sort!.each do |point|
    case point[1]
    when 'a_begin'
      segments_num += 1
    when 'c_end'
      segments_num -= 1
    else
      count[point[0]] = segments_num
    end
  end
  points.map {|pt| count[pt]}
end

rows = gets.chomp.split(' ').map(&:to_i)[0]
segments = []
rows.times do
  points = gets.chomp.split.map(&:to_i)
  segments << Segment.new(points[0], points[1])
end
points = gets.chomp.split(' ').map(&:to_i)

puts fast_count_segments(segments, points).join ' '
