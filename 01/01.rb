INPUT = File.readlines('01/input.txt', chomp: true).map(&:to_i)

SUM_GROUP = ->(acc, v) { v != 0 ? [*acc[...-1], acc[-1] += v] : [*acc, 0] }

puts INPUT.inject([0], &SUM_GROUP).max
puts INPUT.inject([0], &SUM_GROUP).sort[-3..].sum

# After r/adventofcode
# I didn't know about .slice_when
puts INPUT.slice_when { _1.zero? }.map(&:sum).max
puts INPUT.slice_when { _1.zero? }.map(&:sum).sort[-3..].sum

# Why doesn't this work?
# puts INPUT.slice_when(&:zero?).map(&:sum).max
