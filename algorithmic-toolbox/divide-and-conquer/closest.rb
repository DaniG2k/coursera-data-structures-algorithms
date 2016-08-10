#!/usr/bin/ruby

Point = Struct.new(:x, :y)

def distance(p1, p2)
  Math.hypot(p1.x - p2.x, p1.y - p2.y)
end

def closest_recursive(points)
  xP = points.sort_by(&:x)
  mid = points.length / 2
  xm = xP[mid].x
  dL, pairL = closest_recursive(xP[0,mid])
  dR, pairR = closest_recursive(xP[mid..-1])
  dmin, dpair = dL<dR ? [dL, pairL] : [dR, pairR]
  yP = xP.find_all {|p| (xm - p.x).abs < dmin}.sort_by(&:y)
  closest, closestPair = dmin, dpair
  0.upto(yP.length - 2) do |i|
    (i+1).upto(yP.length - 1) do |k|
      break if (yP[k].y - yP[i].y) >= dmin
      dist = distance(yP[i], yP[k])
      if dist < closest
        closest = dist
        closestPair = [yP[i], yP[k]]
      end
    end
  end
  [closest, closestPair]
end

points = []
rows = gets.chomp.to_i
rows.times do
  points << gets.chomp.split.each_slice(2) do |n|
    Point.new(n[0].to_i, n[1].to_i)
  end
end
p points
