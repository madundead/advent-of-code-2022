INPUT = File.readlines('02/input.txt', chomp: true)

MAP1 = {
  'A X' => 4, 'B X' => 1, 'C X' => 7,
  'A Y' => 8, 'B Y' => 5, 'C Y' => 2,
  'A Z' => 3, 'B Z' => 9, 'C Z' => 6
}.freeze

MAP2 = {
  'A X' => 3, 'B X' => 1, 'C X' => 2,
  'A Y' => 4, 'B Y' => 5, 'C Y' => 6,
  'A Z' => 8, 'B Z' => 9, 'C Z' => 7
}.freeze

puts INPUT.map { MAP1[_1] }.sum
puts INPUT.map { MAP2[_1] }.sum
