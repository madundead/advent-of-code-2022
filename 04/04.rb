INPUT =
  File.readlines('04/input.txt', chomp: true)
      .map { _1.split(/-|,/) }.flatten.map(&:to_i)
      .each_slice(4).map { |a, b, c, d| [a..b, c..d] }

puts INPUT.count { |(left, right)| left.cover?(right) || right.cover?(left) }
puts INPUT.count { |(left, right)| (left.to_a & right.to_a).any? }
