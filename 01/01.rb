INPUT = File.readlines('01/input.txt', chomp: true).map(&:to_i)

SUM_GROUP = ->(acc, v) { v != 0 ? [*acc[...-1], acc[-1] += v] : [*acc, 0] }

puts INPUT.inject([0], &SUM_GROUP).max
puts INPUT.inject([0], &SUM_GROUP).sort[-3..].sum
